import re
import sys

def process_file(input_file_name, output_file_name):
    # Regular expression patterns to match the required lines
    warning_pattern = r"WARNING: Adding reference from [0-9a-f]+ to ([0-9a-f]+), which is near other heads"
    error_pattern = r"POSSIBLE ERROR: Not adding reference from [0-9a-f]+ to ([0-9a-f]+)"

    # Use a set to store the extracted digits to ensure uniqueness
    extracted_digits_set = set()

    # Open the input file and process each line
    try:
        with open(input_file_name, 'r') as file:
            for line in file:
                # Check for a match in the line
                warning_match = re.search(warning_pattern, line)
                error_match = re.search(error_pattern, line)

                # If a match is found, add the extracted digits to the set
                if warning_match:
                    extracted_digits_set.add(warning_match.group(1))
                elif error_match:
                    extracted_digits_set.add(error_match.group(1))

        # Write the extracted digits to a text file, one per line
        with open(output_file_name, 'w') as text_file:
            for digit in extracted_digits_set:
                text_file.write(digit + '\n')
    except FileNotFoundError:
        print(f"File not found: {input_file_name}")
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    if len(sys.argv) != 2:
        print("Usage: python extract_file.py <input_file>")
        sys.exit(1)

    input_file_name = sys.argv[1]
    output_file_name = "extracted_bug_digits.txt"
    process_file(input_file_name, output_file_name)

if __name__ == "__main__":
    main()

