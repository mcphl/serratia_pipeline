version 1.0

task hello {
  input{
    Array[File] reports
  }
  command {
    echo ~{sep=" " reports}
  }
  output {
    File response = stdout()
  }
}

workflow test {
  input{
    Array[File] reports
  }
  call hello{
    input: reports = reports
  }
  output{
    String a = read_string(hello.response)
  }
}