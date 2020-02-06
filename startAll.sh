	. ./buildIP.sh
	. ./update.sh
        . ./clean.sh
        . ./start.sh

        i=1
        while ((i <= 6 ))
        do
                echo "waiting mpc start...."
                ((i++))
                sleep 5
        done
	
