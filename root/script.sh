echo "yes" | apic && echo "no" | apic

sed -i 's/visibilidad/$1/g' deploy/prodplantilla.yaml

apic publish deploy/prodplantilla.yaml --server apim --organization $1 --catalog sb
#apic drafts:push deploy/formacionapirest_1.0.0.yaml --server apim --organization factoriaustglobal

#apic login << EOF
#"jose.delagala@ust-global.com"
#"!n0r1t5@C"
#EOF