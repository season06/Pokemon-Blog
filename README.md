# PokemonBlog

## Environment
- Java EE
- Servlet/JSP
- Tomcat
- mariaDB

## Requirement
- 首頁畫面
- 前端輸入資料後，使用 POST 傳送資料到後端，交由對應的 Web 應用程式處理
- 使用 DataSource 與 database 取得連線
- 執行 SQL 時，能夠避免SQL Injection
- database 中使用者的 password 需經過雜湊或加密
- 不得使用明文方式傳輸 password
- 容器安全管理：使用者通過身分驗證後才能存取頁面。自訂登入成功或登入錯誤的畫面
- register、login、logout、重設密碼的功能
- 使用者註冊成功或重設密碼，能收到 mail
- 登入成功的頁面上顯示目前線上人數
- 若頁面中有設計留言功能，能夠過濾掉留言中置入廣告鏈結的HTML

## Additional
- 使用者登入失敗達到三次，凍結帳號並顯示錯誤頁面
- 實現 MVC/Model 2 架構(Model、Controller、View)，將請求處理、商務邏輯和畫面呈現區分為不同的角色職責
