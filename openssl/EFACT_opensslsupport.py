#!/usr/bin/env python
#-------------------------------------------------------------------------------
# scripts/readelf.py
#
# A clone of 'readelf' in Python, based on the pyelftools library
#
# Eli Bendersky (eliben@gmail.com)
# This code is in the public domain
#
# above is the comments of the original pyreadelf project 
# this file is based of pyreadelf
#-------------------------------------------------------------------------------
import argparse
import time
import os, sys
import string
import re
import traceback
import itertools
import json
from collections import defaultdict
# Note: zip has different behaviour between Python 2.x and 3.x.
# - Using izip ensures compatibility.
try:
    from itertools import izip
except:
    izip = zip

# For running from development directory. It should take precedence over the
# installed pyelftools.
sys.path.insert(0, '.')


from elftools import __version__
from elftools.common.exceptions import ELFError
from elftools.elf.elffile import ELFFile
from elftools.common.utils import bytes2str, iterbytes
from elftools.elf.dynamic import DynamicSection, DynamicSegment
from elftools.elf.sections import (
    NoteSection, SymbolTableSection, SymbolTableIndexSection
)
from elftools.elf.gnuversions import (
    GNUVerSymSection, GNUVerDefSection,
    GNUVerNeedSection,
    )
from elftools.elf.relocation import RelocationSection
from elftools.elf.descriptions import (
    describe_ei_class, describe_e_machine,
    )


from elftools.dwarf.locationlists import LocationParser, LocationEntry, LocationViewPair, BaseAddressEntry as LocBaseAddressEntry, LocationListsPair
from elftools.dwarf.ranges import RangeEntry, BaseAddressEntry as RangeBaseAddressEntry, RangeListsPair


#A list of functions include from glibc
GLIBC_FUNCDECL_LIST = defaultdict(list)
#A list of functions include from glibc
GLIBCXX_FUNCDECL_LIST = defaultdict(list)
#A list of functions include from openssl
OPENSSL_FUNCDECL_LIST = defaultdict(list)

#the libc/libcxx_header must be the same with /dict/libc/libcxx.h
#things the libs below did't include all the libs,you can add new libs here. 

libcxx_header = """
#include<bits/stdc++.h>
#include <sstream>
#include <dirent.h>
#include <obstack.h>
#include <getopt.h>
#include <locale.h>
#include <nl_types.h>
#include <strstream>
"""


libc_header = """
#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <float.h>
#include <iso646.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <wchar.h>
#include <wctype.h>
#include <complex.h>
#include <fenv.h>
#include <inttypes.h>
#include <stdalign.h>
#include <stdbool.h>
#include <stdint.h>
#include <tgmath.h>
#include <uchar.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/resource.h>
#include <fcntl.h>
#include <pthread.h>
#include <dirent.h>
#include <obstack.h>
#include <getopt.h>
#include <locale.h>
#include <nl_types.h>
// OpenSSL
#include <openssl/aes.h>
#include <openssl/asn1.h>
#include <openssl/asn1t.h>
#include <openssl/bio.h>
#include <openssl/blowfish.h>
#include <openssl/bn.h>
#include <openssl/buffer.h>
#include <openssl/camellia.h>
#include <openssl/cast.h>
#include <openssl/cmac.h>
#include <openssl/cms.h>
#include <openssl/comp.h>
#include <openssl/conf.h>
#include <openssl/conf_api.h>
#include <openssl/crypto.h>
#include <openssl/ct.h>
#include <openssl/des.h>
#include <openssl/dh.h>
#include <openssl/dsa.h>
#include <openssl/dtls1.h>
#include <openssl/e_os2.h>
#include <openssl/ebcdic.h>
#include <openssl/ec.h>
#include <openssl/ecdh.h>
#include <openssl/ecdsa.h>
#include <openssl/engine.h>
#include <openssl/err.h>
#include <openssl/evp.h>
#include <openssl/hmac.h>
#include <openssl/idea.h>
#include <openssl/kdf.h>
#include <openssl/lhash.h>
#include <openssl/md2.h>
#include <openssl/md4.h>
#include <openssl/md5.h>
#include <openssl/mdc2.h>
#include <openssl/modes.h>
#include <openssl/obj_mac.h>
#include <openssl/objects.h>
#include <openssl/ocsp.h>
#include <openssl/opensslconf.h>
#include <openssl/opensslv.h>
#include <openssl/ossl_typ.h>
#include <openssl/pem.h>
#include <openssl/pem2.h>
#include <openssl/pkcs12.h>
#include <openssl/pkcs7.h>
#include <openssl/rand.h>
#include <openssl/rc2.h>
#include <openssl/rc4.h>
#include <openssl/rc5.h>
#include <openssl/ripemd.h>
#include <openssl/rsa.h>
#include <openssl/safestack.h>
#include <openssl/seed.h>
#include <openssl/sha.h>
#include <openssl/srtp.h>
#include <openssl/srtp.h>
#include <openssl/ssl.h>
#include <openssl/ssl2.h>
#include <openssl/ssl3.h>
#include <openssl/stack.h>
#include <openssl/symhacks.h>
#include <openssl/tls1.h>
#include <openssl/ts.h>
#include <openssl/txt_db.h>
#include <openssl/ui.h>
#include <openssl/whrlpool.h>
#include <openssl/x509.h>
#include <openssl/x509_vfy.h>
#include <openssl/x509v3.h>
"""


#the context used to write json file
json_header = """
{
    "Function" : [
"""
json_end = """
        ]
 }
"""

#the context used to write completion.cpp
cxx_header1 = """
  // mcsema ABI library, automatically generated by generate_abi_wrapper.py
  extern "C" {
"""

cxx_header2 = """
}

__attribute__((used)) void *__mcsema_externs[] = {
"""
#the context used to write completion.c
c_header = """

__attribute__((used)) void *__mcsema_externs[] = {
"""
cORcxx_end = """
};
"""

SPECIFIC_FUNC = ["__isoc99_fscanf", "__isoc99_scanf","__isoc99_sscanf","__isoc99_vfscanf","__isoc99_vscanf","__isoc99_vsscanf",
"__isoc99_fwscanf","__isoc99_wscanf","__isoc99_swscanf","__isoc99_vfwscanf","__isoc99_vswscanf",
"__xpg_strerror_r","__xpg_sigpause","__stack_chk_fail","__fxstat","__xstat","__libc_start_main"]



# a class which referemce the llvm/Demangle.h，which include the key consept of Demangled Func
class MangleNode:
    def __init__(self):
        self.MangledName = ""
        self.BaseName = ""
        self.DeclContextName = ""
        self.Parameters = ""
        self.FunctionName = ""
        self.EntireName = ""
        self.ReturnType = ""
        self.hasFunctionQualifiers =False
        self.isCtorOrDtor =False
        self.isFunction =False
        self.isData =False
        self.isSpecialName =False




class ReadElf(object):
    """ display_* methods are used to emit output into the output stream
    """
    def __init__(self, file, output):
        """ file:
                stream object with the ELF file to read

            output:
                output stream to write to
        """
        self.elffile = ELFFile(file)
        self.output = output

        # Lazily initialized if a debug dump is requested
        self._dwarfinfo = None

        self._versioninfo = None

        self._shndx_sections = None


    # By modifying this function, the automation from parsing the elf file symbol table to 
    # generating supplementary function definitions is realized
    def demangle_symbol_tables_and_generate_complement_functions(self):
        """ Display a strings dump of a section. section_spec is either a
            section number or a name.
        """


        #Anomaly detection that preserves the integrity of the symbol table in the original script
        self._init_versioninfo()

        symbol_tables = [(idx, s) for idx, s in enumerate(self.elffile.iter_sections())
                         if isinstance(s, SymbolTableSection)]

        if not symbol_tables and self.elffile.num_sections() == 0:
            self._emitline('')
            self._emitline('Dynamic symbol information is not available for'
                           ' displaying symbols.')
        GCCLib_path = os.environ['LIFT_GCC_LIB_PATH']

        OPENssl_Lib_path = os.environ['LIFT_OPENSSL_LIB_PATH']
        cpp_flag=False
        openssl_flag=False
        continue_flag=False
        #an elf file has many sections in smytalbes,like '.dynsym','.symtab',
        # in order to cover most of the extern func，we loop all the sections.
        Mangled_nums=0
        for section_index, section in symbol_tables:
            if not isinstance(section, SymbolTableSection):
                continue

            if section['sh_entsize'] == 0:
                self._emitline("\nSymbol table '%s' has a sh_entsize of zero!" % (
                    section.name))
                continue

            self._emitline("\nSymbol table '%s' contains %d %s:" % (
                section.name,
                section.num_symbols(),
                'entry' if section.num_symbols() == 1 else 'entries'))
            
            #This loop is implemented for the main function, which reads the symbol table and processes
            for nsym, symbol in enumerate(section.iter_symbols()):
                #Read the symbol table, only take TYPE=FUNC, Ndx=UND
                if (symbol['st_info'] ['type']== 'STT_FUNC' and
                    symbol['st_shndx'] == 'SHN_UNDEF'):
                    # There is no clear sign in the elf file that the program is a C++ program. 
                    # Here we judge whether the program is a C++ program by 
                    # checking whether the Name Mangling function exists in the symbol table.
                    openssl_obj=re.search('@+OPENSSL[A-Za-z]*_[0-9,.]+',symbol.name) 
                    if openssl_obj !=None:
                        print(111)
                        funcName=symbol.name[0:openssl_obj.regs[0][0]]
                        libVersionName=symbol.name[openssl_obj.regs[0][0]: ]
                        key=funcName
                        OPENSSL_FUNCDECL_LIST[key].append("1")
                        openssl_flag=True

                    if cpp_flag==False:
                        if symbol.name [0:2]=="_Z":
                            cpp_flag=True
                    #The elf file on the x86 platform will have a suffix of ***@@GLIBCXX_3.4 
                    # after the thing taken out of .symtab (one less @ on Arm)
                    libCorCXXverson_obj=re.search('@+GLIBC[A-Za-z]*_[0-9,.]+',symbol.name)
                    if libCorCXXverson_obj !=None:
                        #For the time being, only those with the GLIBC*** logo are processed.
                        funcName=symbol.name[0:libCorCXXverson_obj.regs[0][0]]
                        libVersionName=symbol.name[libCorCXXverson_obj.regs[0][0]: ]
                        if re.search('GLIBCXX',libVersionName):
                            key=funcName
                            GLIBCXX_FUNCDECL_LIST[key].append("1")
                            continue_flag=True
                        else:
                            key=funcName
                            GLIBC_FUNCDECL_LIST[key].append("1")
                            continue_flag=True
        
        #If the program to be translated is a C++ program and there are extern_functions after Name_Mangling
        if  continue_flag==True:
            if cpp_flag and len(GLIBCXX_FUNCDECL_LIST)!=0:
                DemangleToolsPath = os.path.dirname(os.path.abspath(__file__))+"/../DemanglingTools/"
                outfile=DemangleToolsPath+"in.json"
                #First hand over the recognized mangled function to the 
                #C++ internal interface of llvm for processing
                print("Demang number is "+str(len(GLIBCXX_FUNCDECL_LIST))+"\n")
                print("Demang number is "+str(len(GLIBCXX_FUNCDECL_LIST))+"\n")
                print("Demang number is "+str(len(GLIBCXX_FUNCDECL_LIST))+"\n")
                write_json_file(outfile)
                
                print("start to write in.json (if 0 success) ")
                time.sleep(2)
                DemangleToolsCommand = DemangleToolsPath+"Demanglingtools"
                print(os.chdir("../DemanglingTools/"))
                print(os.system(DemangleToolsCommand))
                #Read the processed result
                inputjsonfile=DemangleToolsPath+"out.json"
                print(os.chdir("../pyelftools/"))
                with open(inputjsonfile, 'r') as json_file:
                    json_data = json.load(json_file)

                #write the Complement.c/cpp
                abioutfile=os.path.dirname(os.path.abspath(__file__))+"/../Result/"
                write_cxx_abi_file(abioutfile,json_data,GCCLib_path)
                write_cxx_format_output_file(abioutfile,json_data,GCCLib_path)
            else:
                abioutfile=os.path.dirname(os.path.abspath(__file__))+"/../Result/"
                write_c_abi_file(abioutfile,GCCLib_path,OPENssl_Lib_path, openssl_flag)
                write_c_format_output_file(abioutfile,GCCLib_path,OPENssl_Lib_path, openssl_flag)

        else:
            if openssl_flag==False :
                print("There was a problem parsing the symbol table. end of program")  
                sys.exit()  

        
        #Complement.c/cpp has been generated so far, 
        #and finally the corresponding supplementary LLVMIR is generated
        if cpp_flag == True:
            compiler="clang++"
            liftingFile=abioutfile+"complement.cpp"
        else:
            compiler="clang"
            liftingFile=abioutfile+"complement.c"

        LiftCommand=compiler+ " -emit-llvm  -c  "+ liftingFile+ " -o" +abioutfile+"liftedComplement.bc"
        
        
        print(os.system(LiftCommand))
        LLVMdisCommand="llvm-dis " +abioutfile+"liftedComplement.bc"
        print(os.system(LLVMdisCommand))    




            
                

    def _section_from_spec(self, spec):
        """ Retrieve a section given a "spec" (either number or name).
            Return None if no such section exists in the file.
        """
        try:
            num = int(spec)
            if num < self.elffile.num_sections():
                return self.elffile.get_section(num)
            else:
                return None
        except ValueError:
            # Not a number. Must be a name then
            return self.elffile.get_section_by_name(spec)
    
    
    def _init_versioninfo(self):
        """ Search and initialize informations about version related sections
            and the kind of versioning used (GNU or Solaris).
        """
        if self._versioninfo is not None:
            return

        self._versioninfo = {'versym': None, 'verdef': None,
                             'verneed': None, 'type': None}

        for section in self.elffile.iter_sections():
            if isinstance(section, GNUVerSymSection):
                self._versioninfo['versym'] = section
            elif isinstance(section, GNUVerDefSection):
                self._versioninfo['verdef'] = section
            elif isinstance(section, GNUVerNeedSection):
                self._versioninfo['verneed'] = section
            elif isinstance(section, DynamicSection):
                for tag in section.iter_tags():
                    if tag['d_tag'] == 'DT_VERSYM':
                        self._versioninfo['type'] = 'GNU'
                        break

        if not self._versioninfo['type'] and (
                self._versioninfo['verneed'] or self._versioninfo['verdef']):
            self._versioninfo['type'] = 'Solaris'

    def _emit(self, s=''):
        """ Emit an object to output
        """
        self.output.write(str(s))

    def _emitline(self, s=''):
        """ Emit an object to output, followed by a newline
        """
        self.output.write(str(s).rstrip() + '\n')


SCRIPT_DESCRIPTION = 'Display information about the contents of ELF format files'
VERSION_STRING = '%%(prog)s: based on pyelftools %s' % __version__


def main(stream=None):
    # parse the command-line arguments and invoke ReadElf
    argparser = argparse.ArgumentParser(
            usage='usage: %(prog)s [options] <elf-file>',
            description=SCRIPT_DESCRIPTION,
            add_help=False, # -h is a real option of readelf
            prog='readelf.py')
    argparser.add_argument('file',
            nargs='?', default=None,
            help='ELF file to parse')
    argparser.add_argument('-v', '--version',
            action='version', version=VERSION_STRING)
    argparser.add_argument('-H', '--help',
            action='store_true', dest='help',
            help='Display this information')
    argparser.add_argument('-h', '--file-header',
            action='store_true', dest='show_file_header',
            help='Display the ELF file header')
    argparser.add_argument('-l', '--program-headers', '--segments',
            action='store_true', dest='show_program_header',
            help='Display the program headers')
    argparser.add_argument('-S', '--section-headers', '--sections',
            action='store_true', dest='show_section_header',
            help="Display the sections' headers")
    argparser.add_argument('-output', 
            action='store_true',
            help='the output type of completion C or LLVM IR')      
    #Call the method that generates the supplementary function by registering a new parameter
    argparser.add_argument('-complement', 
            action='store_true', dest='demangle_and_complement_symbols',
            help='Demangle the symbol table and generate complement functions for mcsema')    


    args = argparser.parse_args()

    if args.help or not args.file:
        argparser.print_help()
        sys.exit(0)

    with open(args.file, 'rb') as file:
        try:
            readelf = ReadElf(file, stream or sys.stdout)

            #Add the corresponding registration function call of -complement    
            if args.demangle_and_complement_symbols:
                readelf.demangle_symbol_tables_and_generate_complement_functions()

        except ELFError as ex:
            sys.stdout.flush()
            sys.stderr.write('ELF error: %s\n' % ex)
            if args.show_traceback:
                traceback.print_exc()
            sys.exit(1)


def write_cxx_abi_file(outfile,jsonDict,allDictPath):

    # generate the abi lib cxx file
    dictPath=allDictPath
    outfile=outfile+"complement.cpp"
    with open(outfile, "w") as s:
        #Write the include header file first
        s.write(libcxx_header)
            
        s.write(cxx_header1)
        #The first layer of loops traverses FUNCDECL_LIST
        for value in jsonDict["Function"]:
            value["canBeComplement"]=False
            if value.get("ReturnType") != "":
                s.write("{0} {1} {2};".format(value.get("ReturnType"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            elif value.get("isCtorOrDtor") ==True:
                s.write("void {1} {2};".format(value.get("ReturnType"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            elif re.search('std::[A-Za-z]+',value.get("DeclContextName")):
                s.write("{0} {1} {2};".format(value.get("DeclContextName"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            else:
                sys.path.append(dictPath)
                from allcxxdict_param import dict
                CXXSearchDict=dict.dictionary
                if CXXSearchDict.get(value.get("BaseName"))!=None:
                    if isinstance(CXXSearchDict.get(value.get("BaseName")),list):
                        for funcs in CXXSearchDict.get(value.get("BaseName")):
                            if funcs[1]==value.get("Parameters"):
                                s.write("{0} {1} {2};".format(funcs[0],value.get("MangledName"),value.get("Parameters")))
                                s.write("\n")
                                value["canBeComplement"]=True    
                    else:
                        s.write("{0} {1} {2};".format(CXXSearchDict.get(value.get("BaseName")),value.get("MangledName"),value.get("Parameters")))
                        s.write("\n")
                        value["canBeComplement"]=True
                else:
                    print(value.get("MangledName"))
                    print(" unable to supplement\n")
        
        #for key in GLIBC_FUNCDECL_LIST.keys():
        #    sys.path.append(dictPath)
        #    from allcxxdict_param import dict
        #   CXXSearchDict=dict.dictionary
        #    if CXXSearchDict.get(key)!=None:
        #        list1 =CXXSearchDict.get(key)
        #        i=0
        #        for item in list1:
        #            if isinstance(item, tuple):
        #                if i == len(list1) - 1:
        #                    print(item[0])
        #                    print(item[1])
        #                    print(666666666666)
        #                    s.write("{0} {1} {2};".format(item[0],key,item[1]))
        #                    s.write("\n")
        #                i=i+1
        #            else :
        #                continue    
        s.write(cxx_header2)


        for value in jsonDict["Function"]:
            if value["canBeComplement"]==True:
                s.write("(void *) {0},".format(value["MangledName"]))
                s.write("\n")
        for key in GLIBC_FUNCDECL_LIST.keys():
            sys.path.append(dictPath)
            from allcxxdict_param import dict
            CXXSearchDict=dict.dictionary
            if CXXSearchDict.get(key)!=None:
                list2  =CXXSearchDict.get(key)
                if isinstance(list2[0], tuple):
                    print(key)
                    print(" unable to supplement in LLVM IR\n")
                else:
                    s.write("(void *) {0},".format(key))
                    s.write("\n")
            #else:
                #print(key)
                #print(" unable to supplement\n")


        s.write(cORcxx_end)

def write_c_abi_file(outfile,allDictPath,OPENssl_Lib_path,openssl_flag):

    # generate the abi lib cc file
    outfile=outfile+"complement.c"
    dictPath=allDictPath
    with open(outfile, "w") as s:
        #Write the include header file first
        s.write(libc_header)
        for key in GLIBC_FUNCDECL_LIST.keys():
            if key in SPECIFIC_FUNC:
                sys.path.append(dictPath)
                from allcdict_param import dict
                CSearchDict=dict.dictionary
                if CSearchDict.get(key)!=None:
                    if isinstance(CSearchDict.get(key),list):
                        funcs= CSearchDict.get(key)
                        s.write("{0} {1} {2};".format(funcs[0],key,funcs[1]))
                        s.write("\n")
                else:
                    print(key)
                    print(" unable to supplement\n")
        s.write(c_header)
        for key in GLIBC_FUNCDECL_LIST.keys():
            sys.path.append(dictPath)
            from allcdict_param import dict
            CSearchDict=dict.dictionary
            if CSearchDict.get(key)!=None:
                s.write("(void *) {0},".format(key))
                s.write("\n")
            else:
                print(key)
                print(" unable to supplement\n")
        for key in OPENSSL_FUNCDECL_LIST.keys():
            sys.path.append(OPENssl_Lib_path)
            from openssl import dict
            OpensslSearchDict=dict.dictionary
            if OpensslSearchDict.get(key)!=None:
                s.write("(void *) {0},".format(key))
                s.write("\n")
            else:
                print(key)
                print(" unable to supplement\n")


        s.write(cORcxx_end)


def write_c_format_output_file(outfile,allDictPath,OPENssl_Lib_path,openssl_flag):


    # generate the abi lib cc file
    outfile=outfile+"complement_formatc.c"
    dictPath=allDictPath
    with open(outfile, "w") as s:
        #Write the include header file first
        s.write(libc_header)

        for key in GLIBC_FUNCDECL_LIST.keys():
            sys.path.append(dictPath)
            from allcdict_param import dict
            CSearchDict=dict.dictionary
            if CSearchDict.get(key)!=None:
                if isinstance(CSearchDict.get(key),list):
                    funcs= CSearchDict.get(key)
                    s.write("{0} {1} {2};".format(funcs[0],key,funcs[1]))
                    s.write("\n")
            else:
                print(key)
                print(" unable to supplement\n")
        for key in OPENSSL_FUNCDECL_LIST.keys():
            sys.path.append(OPENssl_Lib_path)
            from openssl import dict
            OpensslSearchDict=dict.dictionary
            if OpensslSearchDict.get(key)!=None:
                if isinstance(OpensslSearchDict.get(key),list):
                    funcs= OpensslSearchDict.get(key)
                    s.write("{0} {1} {2};".format(funcs[0],key,funcs[1]))
                    s.write("\n")
            else:
                print(key)
                print(" unable to supplement\n")


def write_cxx_format_output_file(outfile,jsonDict,allDictPath):


    # generate the abi lib cc file
    outfile=outfile+"complement_formatcxx.cpp"
    dictPath=allDictPath
    with open(outfile, "w") as s:
        #Write the include header file first
        s.write(libcxx_header)

        for key in GLIBC_FUNCDECL_LIST.keys():
            sys.path.append(dictPath)
            from allcxxdict_param import dict
            CXXSearchDict=dict.dictionary
            if CXXSearchDict.get(key)!=None:
                list1 =CXXSearchDict.get(key)
                i=0
                for item in list1:
                    if isinstance(item, tuple):
                        if i == len(list1) - 1:
                            print(item[0])
                            print(item[1])
                            s.write("{0} {1} {2};".format(item[0],key,item[1]))
                            s.write("\n")
                        i=i+1
                    else :
                        continue    
            else:
                print(key)
                print(" unable to supplement\n")


        for value in jsonDict["Function"]:
            value["canBeComplement"]=False
            if value.get("ReturnType") != "":
                s.write("{0} {1} {2};".format(value.get("ReturnType"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            elif value.get("isCtorOrDtor") ==True:
                s.write("void {1} {2};".format(value.get("ReturnType"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            elif re.search('std::[A-Za-z]+',value.get("DeclContextName")):
                s.write("{0} {1} {2};".format(value.get("DeclContextName"),value.get("MangledName"),value.get("Parameters")))
                s.write("\n")
                value["canBeComplement"]=True
            else:
                sys.path.append(dictPath)
                from allcxxdict_param import dict
                CXXSearchDict=dict.dictionary
                if CXXSearchDict.get(value.get("BaseName"))!=None:
                    if isinstance(CXXSearchDict.get(value.get("BaseName")),list):
                        for funcs in CXXSearchDict.get(value.get("BaseName")):
                            if funcs[1]==value.get("Parameters"):
                                s.write("{0} {1} {2};".format(funcs[0],value.get("MangledName"),value.get("Parameters")))
                                s.write("\n")
                                value["canBeComplement"]=True    
                    else:
                        s.write("{0} {1} {2};".format(CXXSearchDict.get(value.get("BaseName")),value.get("MangledName"),value.get("Parameters")))
                        s.write("\n")
                        value["canBeComplement"]=True
                else:
                    print(value.get("MangledName"))
                    print(" unable to supplement\n")






def write_json_file(outfile):
    """ Generate json library source for the Demangling tools; 
    """
    with open(outfile, "w") as s:
        s.truncate()
        s.write(json_header)
        #遍历GLIBCXX_FUNCDECL_LIST
        i=0
        num=len(GLIBCXX_FUNCDECL_LIST)
        for key in GLIBCXX_FUNCDECL_LIST.keys():
                str="{ \"name\":\""+key+"\" }"
                s.write(str)
                i=i+1
                if i!=num:
                    s.write(",")
                s.write("\n")
        s.write(json_end)

    



def profile_main():
    # Run 'main' redirecting its output to readelfout.txt
    # Saves profiling information in readelf.profile
    PROFFILE = 'readelf.profile'
    import cProfile
    cProfile.run('main(open("readelfout.txt", "w"))', PROFFILE)

    # Dig in some profiling stats
    import pstats
    p = pstats.Stats(PROFFILE)
    p.sort_stats('cumulative').print_stats(25)


#-------------------------------------------------------------------------------
if __name__ == '__main__':
    main()
    #profile_main()
