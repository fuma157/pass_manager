# pass_manager

#!/bin/bash

echo "パスワードマネージャーへようこそ"

echo "サービス名を入力してください:"
read sname
echo "ユーザー名を入力してください:"
read uname
echo "パスワードを入力してください:"
read password
echo "$sname:$uname:$password" >> information.txt

echo "Thak you!"
