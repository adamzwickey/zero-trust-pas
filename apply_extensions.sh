for filename in vm_extensions/aws/*.json; do
    [ -e "$filename" ] || continue
    om create-vm-extension -c $filename
done
