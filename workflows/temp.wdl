version 1.0

import "../tasks/fastqc_task.wdl" as fastqc

workflow temp{
	input{
		File query
		File reference = "../data/GCF_003031645.1_ASM303164v1_genomic.fna"
	}
	call fastqc.fastqc_task{
		input: read = query
	}

}