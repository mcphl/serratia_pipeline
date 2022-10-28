version 1.0


task jq_task{
	input{
		String docker = "nanozoo/jq"
		Int cpu = 4
		Int memory = 8

		#jq params
		File in
		String query
	}
	command <<<
		cat ~{in} | jq ~{query} > OUT

	>>>
	runtime{
		docker: "~{docker}"
		cpu: cpu
		memory: "~{memory} GB"
	}
	output{
		String out = read_string("OUT")
	}
}