apic login --username $2  --server apim --password $3
echo "yes" | apic && echo "no" | apic

a='s/visibilidad/'
a+=$1
a+='/g'

sed -i $a deploy/prodplantilla.yaml

apic publish deploy/prodplantilla.yaml --server apim --organization $1 --catalog sb

#sed -i 's/visibilidad/factoriaustglobal/g' deploy/prodplantilla.yaml
#apic publish deploy/prodplantilla.yaml --server apim --organization factoriaustglobal --catalog sb
#apic drafts:push deploy/formacionapirest_1.0.0.yaml --server apim --organization factoriaustglobal

#apic login << EOF
#"jose.delagala@ust-global.com"
#"!n0r1t5@C"
#EOF
