version 1.0


task ragtag_task{
	input{
		String docker = "adash/ragtag:latest"
		Int cpu = 4
		Int memory = 8

		#ragtag params
		File reference
		File query
	}
	command <<<
		ragtag.py scaffold ~{reference} ~{query}

	>>>
	runtime{
		docker: "~{docker}"
		cpu: cpu
		memory: "~{memory} GB"
	}
	output{
		File ragtag_assembly = "ragtag_output/ragtag.scaffold.fasta"
		File ragtag_stats = "ragtag_output/ragtag.scaffold.stats"
	}
}