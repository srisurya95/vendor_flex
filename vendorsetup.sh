for device in $(ls vendor/flex/products | cut -d '.' -f 1)
do
add_lunch_combo flex_$device-userdebug
done
