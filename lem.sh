#!/bin/bash
var=1
echo "%{B#999b1762}"

ram() {
	echo "used : `free | sed '2!d' |  awk '{ print $3 }'` kB /  `  free | sed '2!d'  | awk '{ print $2}' ` kB  "	
}

workspaceparse() {
	
	i3-msg -t get_workspaces | awk -F "[" '{ print $2 }' | awk -F "{" '{ print $'${wscheck}' }' 2> /dev/null | awk -F "," '{ print $2,$3 }' 
}


workspacecheck() {
	wssel=1
	while [ $wssel -le 11 ];do
		echo "$(workspaceparse)" 
		export wscheck=$(( wssel * 2 )) && wssel=$((wssel + 1 ))
	done

}
workspaceactive(){
	activews="na"
	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $4 }' `
	case $formatted in
		true)
			# ws1
			export activews=1
			exit "1"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $8 }' `
	case $formatted in
		true)
			# ws2
			export activews=2
			exit "2"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $12 }' `
	case $formatted in
		true)
			# ws3
			export activews=3
			exit "3"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $16 }' `
	case $formatted in
		true)
			# ws4
			export activews=4
			exit "4"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $20 }' `
	case $formatted in
		true)
			# ws5
			export activews=5
			exit "5"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $24 }' `
	case $formatted in
		true)
			# ws6
			export activews=6
			exit "6"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $28 }' `
	case $formatted in
		true)
			# ws7
			export activews=7
			exit "7"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $32 }' `
	case $formatted in
		true)
			# ws8
			export activews=8
			exit "8"
			;;
	esac

	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $36 }' `
	case $formatted in
		true)
			# ws9
			export activews=9
			exit "9"
			;;
	esac
	
	formatted=`echo $(workspacecheck) | sed 's/"//g;s/ /:/g' | awk ' BEGIN { FS=":" }  { print $40 }' `
	case $formatted in
		true)
			# ws0
			export activews=0
			exit "10"
			;;
	esac
}
workspaceviewparse() {
	case $? in
		1)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/1/%{B#99831cd8}[1]%{B#999b1762}/'
			;;
2)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/2/%{B#99831cd8}[2]%{B#999b1762}/'
			;;
3)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/3/%{B#99831cd8}[3]%{B#999b1762}/'
			;;
4)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/4/%{B#99831cd8}[4]%{B#999b1762}/'
			;;
5)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/5/%{B#99831cd8}[5]%{B#999b1762}/'
			;;
6)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/6/%{B#99831cd8}[6]%{B#999b1762}/'
			;;
7)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/7/%{B#99831cd8}[7]%{B#999b1762}/'
			;;
8)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/8/%{B#99831cd8}[8]%{B#999b1762}/'
			;;
9)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/9/%{B#99831cd8}[9]%{B#999b1762}/'
			;;
10)
			echo $(workspacecheck) |  awk -F ":" '{ print $2,$4,$6,$8,$10,$12,$14,$16,$18,$20  }' | sed 's/"//g;s/visible//g' | sed 's/10/%{B#99831cd8}[10]%{B#999b1762}/'
			;;

		esac

}

#echo $(workspaceparse)
#echo $(workspacecheck)
#$(workspaceactive)
#echo $?
#echo $(workspaceviewparse)



while [ $var != 0 ];do
	`workspaceactive`
	echo "%{l} $(workspaceviewparse)  %{c}  $(ram) "
	sleep 0.5
done


