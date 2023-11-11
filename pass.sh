# pass_manager

#!/bin/bash

while true; do
	echo "パスワードマネージャーへようこそ!"
	echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
	
	read choice

	case $choice in
		#Add passwordが入力された場合
		"Add Password")
			read -p "サービス名を入力してください:" sname
			read -p "ユーザー名を入力してください:" uname
			read -p "パスワードを入力してください:" password

			echo "$sname:$uname:$password" >> information.txt
			echo "パスワードの追加は成功しました。"
			;;
		#Get Passwordが入力された場合
		"Get Password")
			read -p "サービス名を入力してください:" sname

			password=$(grep "$sname:" information.txt | cut -d: -f3)

			if [ -z "$password" ]; then
				echo "そのサービスは登録されていません。"
			else
				echo "サービス名: $sname"
				echo "ユーザー名: $(grep "^$sname:" information.txt | cut -d: -f2)"
				echo "パスワード: $password"
			fi
			;;

		#Exitが入力された場合
		"Exit")
		        echo "Thank you!"
			exit
			;;

		#Add Password/Get Password/Exit 以外が入力された場合
		* )
			echo "入力が間違えています。 Add Password/Get Password/Exit から入力してください。"
			;;
	esac
done
