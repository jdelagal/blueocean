echo "yes" | apic && echo "no" | apic

echo "Visibilidad: $paramVisibilidad"

sed -i 's/visibilidad/$paramVisibilidad/g' deploy/prodplantilla.yaml

apic publish deploy/prodplantilla.yaml --server apim --organization $paramVisibilidad --catalog sb
#apic drafts:push deploy/formacionapirest_1.0.0.yaml --server apim --organization factoriaustglobal

#apic login << EOF
#"jose.delagala@ust-global.com"
#"!n0r1t5@C"
#EOF