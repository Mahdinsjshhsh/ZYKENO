#!/bin/bash

start_ip="212.77.0.0"
end_ip="212.77.255.255"

ip_to_int() {
    local ip="$1"
    local a b c d
    IFS=. read -r a b c d <<< "$ip"
    echo $((a * 256**3 + b * 256**2 + c * 256 + d))
}

int_to_ip() {
    local ip_int="$1"
    echo "$((ip_int >> 24 & 255)).$((ip_int >> 16 & 255)).$((ip_int >> 8 & 255)).$((ip_int & 255))"
}

generate_Qatar_DNS() {
    local start_int=$(ip_to_int "$start_ip")
    local end_int=$(ip_to_int "$end_ip")
    local Qatar_DNS_int=$((RANDOM % (end_int - start_int + 1) + start_int))
    int_to_ip "$Qatar_DNS_int"
}

typing_effect() {
    local text="$1"
    local color_code="$2"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${color_code}${text:$i:1}\033[0m"
        sleep 0.05
    done
    echo
}

orange_color="\033[31m"
red_color="\033[34m"
blue_color="\033[35m"
gray_color="\033[32m"
pink_color="\033[36m"

typing_effect "Made By Timsar" "$orange_color"
typing_effect "Qatar DNS " "$red_color"

typing_effect "How many DNS should I make for you?" "$blue_color"
read -r num_ips

typing_effect "Under Construction $num_ips DNS" "$gray_color"
for (( i=0; i<num_ips; i++ )); do
    Qatar_DNS=$(generate_Qatar_DNS)
    typing_effect "Qatar DNS: $Qatar_DNS" "$pink_color"
done
