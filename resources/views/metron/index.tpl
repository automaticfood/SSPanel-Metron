<!-- {if $metron['index_enable'] == true}
    {include file='index-a.tpl'}
{else}
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta http-equiv="refresh" content="0;url=/user">
    </head>
    </html>
{/if} -->
{if $metron['index_enable'] == true}
    {include file='index-a.tpl'}
{else}
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>登录注册页面</title>
        <style>
            /* 设置渐变背景 */
            body {
                height: 100vh;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #89CFF0, #A7D8FF); /* 柔和的蓝色渐变 */
                font-family: Arial, sans-serif;
            }
            /* 按钮共同样式 */
            .btn {
                padding: 15px 30px;
                font-size: 16px;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: all 0.3s ease;
                margin: 10px;
            }
            /* 登录按钮的样式 */
            .login-btn {
                background-color: #4B9CD3; /* 柔和蓝色 */
            }
            /* 注册按钮的样式 */
            .register-btn {
                background-color: #6DBF72; /* 柔和绿色 */
            }
            /* 按钮 hover 效果 */
            .btn:hover {
                transform: scale(1.05);
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <!-- 登录按钮 -->
        <button class="btn login-btn" onclick="window.location.href='/user';">登录</button>
        <!-- 注册按钮 -->
        <button class="btn register-btn" onclick="window.location.href='/auth/login';">注册</button>
    </body>
    </html>
{/if}
