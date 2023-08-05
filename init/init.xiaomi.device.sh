#!/vendor/bin/sh

set_acdb_path_props() {
	i=0
	for f in `ls /vendor/etc/acdbdata/${1}/*.*`; do
		setprop "persist.vendor.audio.calfile${i}" "${f}"
		let i+=1
	done
}

case "$(cat /sys/firmware/devicetree/base/model)" in
	"PINE QRD")
		setprop ro.vendor.xiaomi.device pine
		# Audio
		set_acdb_path_props pine
		;;
	"Olive QRD")
		setprop ro.vendor.xiaomi.device olive
		# Audio
		set_acdb_path_props olive
		# Charger
		setprop persist.vendor.ctm.disallowed true
		;;
esac

exit 0
