echo "yes" | apic && echo "no" | apic
#echo "apim" | apic login && echo "jose.delagala@ust-global.com" | apic login && echo "!n0r1t5@C" | apic login
apic login << EOF
jose.delagala@ust-global.com
!n0r1t5@C
EOF
apic drafts:push deploy/formacionapirest_1.0.0.yaml --server apim --organization factoriaustglobal

#apic login << EOF
#"jose.delagala@ust-global.com"
#"!n0r1t5@C"
#EOF