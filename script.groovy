print 'Empieza el despliegue.'

sh('apic -h')

//apic yes no
//./apic login apim jose.delagala@ust-global.com !n0r1t5@C
print 'Finaliza el despliegue.'

def sh(cmd) {
    def proc = ["/bin/sh", "-c", cmd].execute()
    proc.waitFor()
    def exitValue = proc.exitValue()
    if(exitValue != 0) {
        System.err.println(stderrFuture.get())
        throw new RuntimeException("$cmd returned $exitValue")
    }
    return stdoutFuture.get()
}