print 'Empieza el despliegue.'

def proc = "ls -ltr".execute()
def b = new StringBuffer()
proc.consumeProcessErrorStream(b)

println proc.text
println b.toString()

//apic yes no
//./apic login apim jose.delagala@ust-global.com !n0r1t5@C
print 'Finaliza el despliegue.'