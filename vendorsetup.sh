for device in $(cat vendor/flex/flex.devices)
do
add_lunch_combo flex_$device-userdebug
done
