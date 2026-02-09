get_battery_level() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk -F' ' '{print $2}'
}

get_time_hour() {
    timedatectl | grep "Local time" | awk -F' ' '{print $5}' | awk -F':' '{print $1}'
}

get_time_minute() {
    timedatectl | grep "Local time" | awk -F' ' '{print $5}' | awk -F':' '{print $2}'
}

get_date_day() {
    timedatectl | grep "Local time" | awk -F' ' '{print $4}' | awk -F'-' '{print $3}'
}

get_date_month() {
    timedatectl | grep "Local time" | awk -F' ' '{print $4}' | awk -F'-' '{print $2}'
}

get_wifi() {
    nmcli device status | grep " wifi " | awk -F' ' '{print $4}'
}

get_volume() {
    wpctl get-volume @DEFAULT_SINK@ | awk -F' ' '{print $2*100}'
}

get_mute() {
    wpctl get-volume @DEFAULT_SINK@ | awk -F' ' '{print $3}'
}

get_cpu_temp() {
    cat /sys/class/thermal/thermal_zone9/temp | awk '{print $1/1000}'
}

WIFI_OUTPUT=''

while true
do
    WIFI_OUTPUT=$(get_wifi)
    VOLUME=$(get_volume)
    MUTE_STATUS=$(get_mute)

    if [[ ${MUTE_STATUS} == "[MUTED]" ]];
    then
        VOLUME=${MUTE_STATUS}
    fi

    printf "|| V: %s | CPU: %s° | %s | %s | %s:%s | %s/%s ||\n" "${VOLUME}" $(get_cpu_temp) "${WIFI_OUTPUT}" $(get_battery_level) $(get_time_hour) $(get_time_minute) $(get_date_day) $(get_date_month)
done
