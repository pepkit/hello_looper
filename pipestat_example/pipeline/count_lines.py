import pipestat
import sys

# Very Simple Pipeline that calls pipestat
# takes arguments invoked during looper submission via command templates
text_file = sys.argv[1]
sample_name = sys.argv[2]
schema_path = sys.argv[3]
results_file = sys.argv[4]
pipeline_type = sys.argv[5]

# Create pipestat manager and then report values
psm = pipestat.PipestatManager(
    schema_path=schema_path,
    results_file_path=results_file,
    sample_name=sample_name,
    pipeline_type=pipeline_type,
)

# TODO open input file to count its lines
# Read text file and count lines
# This is the simple computing part of this pipeline
number_of_lines = 4
# The results are defined in the output schema.
result = {"number_of_lines": number_of_lines}
psm.report(sample_name=sample_name, values=result)
# end of pipeline
