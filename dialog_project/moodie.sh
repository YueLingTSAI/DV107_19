dialog --title "嗨 ! 你今天過的好嗎 ?" --msgbox "歡迎使用Moodie日記小站" 6 40

name=$(dialog --stdout --title "請輸入使用者帳號" --inputbox "使用者名字" 8 30)
password=$(dialog --stdout --title "請輸入密碼" --passwordbox "請輸入您的密碼" 8 30)
dialog --title "確認" --msgbox "\n您的帳號：$names\n密碼已接收！" 8 30

date_file=$(mktemp)
dialog --title "選擇日期" --calendar "請選擇記錄日期" 0 0 0 2> "$date_file"
selected_date=$(cat "$date_file")
rm -f "$date_file"

diary_file=$(mktemp)
dialog --title "心情日記" --inputbox "請寫下您的心情日記" 10 50 2> "$diary_file"
diary_entry=$(cat "$diary_file")
rm -f "$diary_file"

dialog --title "任務完成" --msgbox "加油！每一天都是新的開始！" 6 40

choice=$(dialog --stdout --title "操作選擇" --menu "請選擇操作" 15 50 2 \
    1 "完成日記並離開" \
    2 "回到日期選單")
if [ "$choice" == "1" ]; then
    dialog --title "感謝" --msgbox "日記已完成，明天見！" 6 40
elif [ "$choice" == "2" ]; then
    # 重新選擇日期
    date_file=$(mktemp)
    selected_date=$(dialog --stdout --title "選擇日期" --calendar "請選擇記錄日期" 0 0 0 2> "$date_file")
    rm -f "$date_file"
    dialog --title "日期選擇" --msgbox "您選擇的日期是：$selected_date" 8 40
    
    # 再次輸入日記
    diary_file=$(mktemp)
    diary_entry=$(dialog --stdout --title "心情日記" --inputbox "請寫下您的心情日記" 10 50 2> "$diary_file")
    rm -f "$diary_file"
    
    # 更新日記完成，顯示更新訊息，然後跳轉到感謝頁面
    dialog --title "日記更新完成" --msgbox "日記已更新紀錄！" 6 40
    dialog --title "感謝" --msgbox "日記已完成，明天見！" 6 40
fi

clear
