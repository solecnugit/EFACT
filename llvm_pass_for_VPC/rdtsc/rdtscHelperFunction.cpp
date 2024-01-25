/**
该文件描述的是arm上处理rdtsc的helper function的设计。
主要通过读取pmccntr_el0寄存器实现跟X86上的rdtsc读取TSC一样的效果。
*/
#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <sched.h>

typedef struct {
    uint64_t pmu_val;
    int selected_coreID;
}RdtscTemp;

//extern int SelectedCoreID = 0;

//读取当前的processor id，对齐rdtscp对IA_32_AUX的读取。
static inline uint64_t
 read_mpidr_el1() {
    uint64_t val;
    asm volatile("mrs %0, MPIDR_EL1" : "=r" (val));
    return val;
}
//读取pmuser寄存器，查看当前core是否有权限读取TSC
static inline uint64_t
read_pmccntr()
{
	uint64_t val;
	asm volatile("mrs %0, pmuserenr_el0" : "=r"(val));
	return val;
}
//读取TSC。接收一个selected_coreID参数作为全局统一的读取TSC的core id。
static inline RdtscTemp RdtscReadPmccntr(int SelectedCoreID)
{
    //当SelectedCoreID不为0时，表示已经选择了一个core来读取TSC。
    //为了保证全局一致性，需要保证所有的core都选择了同一个core来读取TSC。
    if(SelectedCoreID!=0)
    {
        printf("already select a core\n");
    }else
    //当SelectedCoreID为0时，表示需要自动选择一个core来读取TSC。
    {
        int num_cores;

        num_cores = sysconf(_SC_NPROCESSORS_ONLN);
        if (num_cores == -1) {
            perror("sysconf");
            exit(EXIT_FAILURE);
        }
        int i;
        for (i=8;i<num_cores;i++)
        {
            cpu_set_t mask;
            int core_id = i;

            CPU_ZERO(&mask);
            CPU_SET(core_id, &mask);

            // 设置当前进程的CPU亲和性
            if (sched_setaffinity(0, sizeof(mask), &mask) == -1) {
                perror("sched_setaffinity");
                exit(EXIT_FAILURE);
            }

            printf("Running on core %d\n", core_id);

            uint64_t pmu_val = read_pmccntr();
            if (pmu_val==5)
            {
                SelectedCoreID = i;
                break;
            }
            printf("Core %d do not match the condition\n", core_id);       
        }
    }
    
    


	uint64_t val;
	asm volatile("mrs %0, pmccntr_el0" : "=r"(val));
	RdtscTemp temp;
    temp.pmu_val = val;
    temp.selected_coreID = SelectedCoreID;
    
    return temp;


}

static inline uint64_t RdtscpReadPmccntr(int SelectedCoreID)
{


    cpu_set_t mask;
    int core_id = SelectedCoreID;

    CPU_ZERO(&mask);
    CPU_SET(core_id, &mask);

    // 设置当前进程的CPU亲和性
    if (sched_setaffinity(0, sizeof(mask), &mask) == -1) {
        perror("sched_setaffinity");
        exit(EXIT_FAILURE);
    }

    printf("Running on core %d\n", core_id);

	uint64_t val;
	asm volatile("mrs %0, pmccntr_el0" : "=r"(val));
    
    return val;


}








extern "C" RdtscTemp rdtsc_mcsema(int SelectedCoreID) 
	{
	#ifdef DEBUG
    printf("进入了rdtsc_mcsema的runtime support\n");
	#endif
    RdtscTemp rdtscStartVal=RdtscReadPmccntr(SelectedCoreID);
	#ifdef DEBUG
    printf("结束了rdtsc_mcsema的runtime support\n");
	#endif
	return rdtscStartVal;

}



extern "C" uint64_t* rdtscp_mcsema(int SelectedCoreID) 
	{
	#ifdef DEBUG
    printf("进入了rdtscp_mcsema的runtime support\n");
	#endif
    
    // Allocate space for two uint64_t values.
    uint64_t* resultList = (uint64_t*)malloc(2 * sizeof(uint64_t));
    if (!resultList) {
        perror("Failed to allocate memory for result list");
        exit(EXIT_FAILURE);
    }

    resultList[0] = RdtscpReadPmccntr(SelectedCoreID);
    resultList[1] = read_mpidr_el1();
    #ifdef DEBUG
    printf("结束了rdtscp_mcsema的runtime support\n");
	#endif
    
    return resultList;
}

/*int main()
{
    RdtscTemp temp=RdtscReadPmccntr(SelectedCoreID);
    printf("pmu_val:%lu\n",temp.pmu_val);
    printf("selected_coreID:%d\n",temp.selected_coreID);
    uint64_t* resultList = rdtscp_mcsema(temp.selected_coreID);
    printf("pmu_val:%lu\n",resultList[0]);
    printf("MPIDR_EL1:%lu\n",resultList[1]);
    SelectedCoreID=temp.selected_coreID;

    RdtscTemp temp2=RdtscReadPmccntr(SelectedCoreID);
    printf("pmu_val:%lu\n",temp2.pmu_val);
    printf("selected_coreID:%d\n",temp2.selected_coreID);
    uint64_t* resultList2 = rdtscp_mcsema(temp2.selected_coreID);
    printf("pmu_val:%lu\n",resultList2[0]);
    printf("MPIDR_EL1:%lu\n",resultList2[1]);
    return 0;
}*/


