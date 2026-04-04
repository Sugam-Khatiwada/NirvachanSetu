<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - NirvachanSetu</title>
    <style>
        * {
            box-sizing: border-box;
        }
        :root {
            --primary-blue: #1A3673; /* Made it match the image dark blue */
            --primary-blue-hover: #152B5C;
            --bg-color: #f4f6f9;
            --text-dark: #333;
            --text-gray: #666;
            --input-bg: #EAECEF;
            --input-border: transparent;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Main Layout */
        .main-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            width: 100%;
        }
        .card {
            display: flex;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            overflow: hidden;
            width: 100%;
            max-width: 950px;
            min-height: 600px;
        }

        /* Left Panel */
        .sidebar {
            background-color: var(--primary-blue);
            color: #ffffff;
            width: 45%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            position: relative;
            background-image: linear-gradient(135deg, #1A3673 0%, #152B5C 100%);
        }
        
        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 60px;
        }
        
        .sidebar h2 {
            font-size: 32px;
            margin-top: 0;
            margin-bottom: 20px;
            line-height: 1.3;
            font-weight: 700;
        }
        
        .sidebar p {
            font-size: 15px;
            line-height: 1.6;
            color: #A9BBE0;
            margin-bottom: 40px;
        }
        
        .authentication-box {
            margin-top: auto;
            background-color: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 20px;
        }
        .auth-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .authentication-box p {
            margin: 0;
            font-size: 12px;
            color: #A9BBE0;
            line-height: 1.5;
        }

        /* Right Panel (Form) */
        .form-section {
            width: 55%;
            padding: 60px 80px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-section h3 {
            margin: 0 0 8px 0;
            font-size: 28px;
            color: var(--primary-blue);
        }
        .form-section > p {
            margin: 0 0 40px 0;
            color: var(--text-gray);
            font-size: 14px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 22px;
            position: relative;
        }
        
        .label-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }
        
        label {
            font-size: 12px;
            font-weight: 700;
            color: #333;
        }
        
        .forgot-password {
            font-size: 11px;
            color: #0056b3;
            text-decoration: none;
            font-weight: 600;
        }
        .forgot-password:hover {
            text-decoration: underline;
        }
        
        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            color: #888;
            width: 16px;
            height: 16px;
        }
        
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 14px 15px 14px 40px;
            border: 1px solid var(--input-border);
            border-radius: 8px;
            background-color: var(--input-bg);
            font-size: 14px;
            color: #333;
            transition: all 0.2s;
            outline: none;
            box-sizing: border-box;
        }
        input:focus {
            background-color: #fff;
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 3px rgba(26, 54, 115, 0.1);
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
        }
        .checkbox-group input {
            width: 16px;
            height: 16px;
            accent-color: var(--primary-blue);
        }
        .checkbox-group label {
            font-size: 13px;
            font-weight: 500;
            color: var(--text-gray);
            cursor: pointer;
        }

        /* Buttons/Links */
        .btn-submit {
            width: 100%;
            background-color: var(--primary-blue);
            color: white;
            border: none;
            padding: 16px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        .btn-submit:hover {
            background-color: var(--primary-blue-hover);
        }
        
        .divider {
            height: 1px;
            background-color: #eee;
            margin: 30px 0;
            width: 100%;
        }
        
        .register-link {
            text-align: center;
            font-size: 14px;
            color: var(--text-gray);
            margin-bottom: 30px;
        }
        .register-link a {
            color: #0056b3;
            text-decoration: none;
            font-weight: 700;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .bottom-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            font-size: 11px;
            font-weight: 600;
            color: #888;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .bottom-links span {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        /* Footer */
        footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            font-size: 11px;
            color: #888;
            font-weight: 500;
        }
        
        .footer-left strong {
            color: #333;
            display: block;
            margin-bottom: 5px;
            font-size: 12px;
        }
        
        .footer-links {
            display: flex;
            gap: 20px;
        }
        .footer-links a {
            color: #888;
            text-decoration: none;
        }
        .footer-links a:hover {
            color: #333;
        }
        
        #message {
            margin-top: 15px;
            font-size: 13px;
            text-align: center;
            font-weight: 500;
        }
        .success { color: green; }
        .error { color: red; }

        /* Responsive Design */
        .mobile-header {
            display: none;
            text-align: center;
            margin-bottom: 20px;
        }

        .mobile-header h1 {
            color: var(--primary-blue);
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .mobile-header .underline {
            width: 40px;
            height: 3px;
            background-color: #007bff;
            margin: 5px auto 0;
            border-radius: 2px;
        }

        .auth-buttons-wrapper {
            display: none;
        }
        
        .info-card {
            display: none;
        }

        .fine-print {
            display: none;
        }

        @media (max-width: 850px) {
            body {
                background-color: #F8F9FA;
            }
            .main-wrapper {
                padding: 10px 20px; /* Reduced paddings */
                width: 100%;
                box-sizing: border-box;
                display: block;
            }
            .card {
                box-shadow: none;
                background: transparent;
                width: 100%;
                box-sizing: border-box;
            }
            .sidebar {
                display: none; /* Hide sidebar completely */
            }
            .mobile-header {
                display: block;
            }
            .form-section {
                padding: 0;
                width: 100%;
                box-sizing: border-box;
            }
            .form-section h3 {
                text-align: center;
                font-size: 26px;
                color: #111;
            }
            .form-section > p {
                text-align: center;
                font-size: 14px;
                color: #555;
            }
            
            input[type="text"], input[type="password"] {
                background-color: #FFFFFF;
                border-radius: 12px;
                padding: 16px 15px 16px 40px;
            }

            .btn-submit {
                border-radius: 24px;
                padding: 14px;
                font-size: 16px;
            }
            
            .divider-text {
                position: relative;
                text-align: center;
                margin: 30px 0;
            }
            .divider-text::before, .divider-text::after {
                content: '';
                position: absolute;
                top: 50%;
                width: 30%;
                height: 1px;
                background-color: #e0e0e0;
            }
            .divider-text::before { left: 0; }
            .divider-text::after { right: 0; }
            .divider-text span {
                color: #777;
                font-size: 11px;
                font-weight: 600;
                letter-spacing: 1px;
            }

            .divider {
                display: none; /* Hide old divider */
            }

            .auth-buttons-wrapper {
                display: flex;
                gap: 15px;
                margin-bottom: 30px;
            }
            .auth-btn {
                flex: 1;
                background: #FFFFFF;
                border: none;
                border-radius: 12px;
                padding: 14px;
                font-weight: 600;
                font-size: 14px;
                color: #333;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            }

            .info-card {
                display: flex;
                align-items: center;
                background: #FFFFFF;
                border-radius: 16px;
                padding: 15px;
                margin-bottom: 20px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            }
            .info-icon {
                background: var(--primary-blue);
                color: white;
                width: 36px;
                height: 36px;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                flex-shrink: 0;
                margin-right: 15px;
            }
            .info-text {
                flex: 1;
            }
            .info-text h4 {
                margin: 0 0 2px 0;
                font-size: 13px;
                color: var(--primary-blue);
            }
            .info-text p {
                margin: 0;
                font-size: 11px;
                color: #666;
            }
            .info-arrow {
                background: var(--primary-blue);
                color: white;
                width: 32px;
                height: 32px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .fine-print {
                display: block;
                font-size: 9px;
                text-align: center;
                color: #999;
                text-transform: uppercase;
                line-height: 1.4;
                margin-top: 10px;
            }

            footer {
                display: none;
            }
            .bottom-links {
                display: none;
            }
        }
    </style>
</head>
<body>

    <div class="main-wrapper">
        <div class="card">
            
            <!-- Left Sidebar -->
            <div class="sidebar">
                <div class="sidebar-logo">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.29 7 12 12 20.71 7"></polyline><line x1="12" y1="22" x2="12" y2="12"></line></svg>
                    NirvachanSetu
                </div>
                
                <h2>Empowering the<br>Digital Democracy.</h2>
                <p>Access your secure voting portal, track candidates, and participate in the future of governance.</p>
                
                <div class="authentication-box">
                    <div class="auth-title">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path><polyline points="9 12 11 14 15 10"></polyline></svg>
                        Secure Authentication
                    </div>
                    <p>Your identity is protected by multi-layer encryption and EC-standard security protocols.</p>
                </div>
            </div>

            <!-- Right Form -->
            <div class="form-section">
                <div class="mobile-header">
                    <h1>NirvachanSetu</h1>
                    <div class="underline"></div>
                </div>

                <h3>Portal Access</h3>
                <p>Please enter your credentials to proceed to the secure voting terminal.</p>

                <form id="loginForm">
                    <div class="form-group">
                        <div class="label-row">
                            <label for="username">VOTER IDENTIFICATION (VID)</label>
                        </div>
                        <div class="input-wrapper">
                            <svg class="input-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            <input type="text" id="username" name="username" placeholder="12-digit VID Number" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="label-row">
                            <label for="password">PASSCODE</label>
                        </div>
                        <div class="input-wrapper">
                            <svg class="input-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                            <input type="password" id="password" name="password" placeholder="••••••••" required>
                            <!-- You can add an eye icon svg here positioned right -->
                            <svg style="position: absolute; right: 15px; width: 16px; height: 16px; color: #888; cursor: pointer;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                        </div>
                    </div>
                    
                    <div class="checkbox-group" style="justify-content: space-between;">
                        <div style="display: flex; align-items: center; gap: 8px;">
                            <input type="checkbox" id="remember" name="remember">
                            <label for="remember">Remember me</label>
                        </div>
                        <a href="#" class="forgot-password">Forgot Access?</a>
                    </div>

                    <button type="submit" class="btn-submit">
                        Sign In to Secure Portal
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                    </button>
                    
                    <div id="message"></div>
                </form>

                <div class="divider"></div>
                <div class="divider-text">
                    <span>OR AUTHENTICATE VIA</span>
                </div>

                <div class="auth-buttons-wrapper">
                    <button class="auth-btn">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                        Digital ID
                    </button>
                    <button class="auth-btn">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#007bff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect></svg>
                        m-Token
                    </button>
                </div>

                <div class="register-link">
                    Don't have an account? <a href="register.jsp">Register for E-Voting</a>
                </div>

                <div class="info-card">
                    <div class="info-icon">i</div>
                    <div class="info-text">
                        <h4>New to NirvachanSetu?</h4>
                        <p>Learn how to vote securely</p>
                    </div>
                    <div class="info-arrow">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                    </div>
                </div>

                <div class="fine-print">
                    THIS PORTAL IS PROTECTED BY NATIONAL SECURITY PROTOCOLS.<br>
                    UNAUTHORIZED ACCESS IS STRICTLY PROHIBITED AND SUBJECT TO LEGAL ACTION.
                </div>
                
                <div class="bottom-links">
                    <span>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
                        Language: English
                    </span>
                    <span>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                        Support
                    </span>
                </div>
            </div>

        </div>
    </div>

    <footer>
        <div class="footer-left">
            <strong>NirvachanSetu</strong>
            © 2024 Election Commission. All rights reserved.
        </div>
        <div class="footer-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Accessibility</a>
            <a href="#">Contact Support</a>
        </div>
    </footer>

    <script>
        // Form submission logic (you'll need to create a LoginServlet)
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Processing login...';
            messageDiv.className = '';
            
            const formData = new URLSearchParams(new FormData(this));
            fetch('${pageContext.request.contextPath}/api/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData
            })
            .then(response => response.json().then(data => ({ status: response.status, body: data })))
            .then(res => {
                messageDiv.textContent = res.body.message;
                if (res.status === 200) {
                    messageDiv.classList.add('success');
                } else {
                    messageDiv.classList.add('error');
                }
            })
            .catch(error => {
                messageDiv.textContent = 'An error occurred while connecting to the server.';
                messageDiv.classList.add('error');
            });
        });
    </script>
</body>
</html>
