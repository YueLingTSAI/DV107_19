### 設計發想及展示方式
1. 歡迎提示：msgbox 顯示歡迎訊息
2. 資訊框輸入：inputbox 讓使用者輸入姓名，密碼用不顯示輸入框
3. 確認畫面：msgbox 確認顯示使用者輸入的帳號及密碼
4. 選擇日期：calendar 讓使用者選取日期
5. 日記輸入：inputbox 提示使用者寫下心情日記
6. 完成日記：msgbox顯示完成並給予鼓勵
7. 鼓勵提示與選單：顯示鼓勵的話後，menu 對話框提供「完成日記並離開」或「回到日期選單」的選擇
- 選擇「完成日記並離開」：msgbox 顯示結語
- 選擇「回到日期選單」：calendar 讓使用者重新選取日期，msgbox 顯示日期的選擇
   - inputbox 寫入該日期的日記
   - msgbox 顯示更新日記完成
   - 跳轉回 msgbox 顯示結語
8. 在程式碼末端設置clear，保持使用者畫面的簡潔

### 在虛擬機上的執行步驟
```
vim moodie.sh
chmod +x moodie.sh
./moodie.sh
```