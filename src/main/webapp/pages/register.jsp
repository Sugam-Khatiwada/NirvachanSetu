<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account - NirvachanSetu</title>
    <style>
        :root {
            --primary-blue: #002060;
            --primary-blue-hover: #001540;
            --bg-color: #f4f6f9;
            --text-dark: #333;
            --text-gray: #666;
            --input-bg: #f8f9fc;
            --input-border: #d1d5db;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: transparent;
        }
        .logo {
            font-weight: 800;
            font-size: 20px;
            color: var(--primary-blue);
            letter-spacing: -0.5px;
        }
        .support-link {
            color: #0056b3;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }

        /* Main Layout */
        .main-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        .card {
            display: flex;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
            width: 100%;
            max-width: 950px;
            min-height: 600px;
        }

        /* Left Panel */
        .sidebar {
            background-color: var(--primary-blue);
            color: #ffffff;
            width: 35%;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
        }
        .sidebar h2 {
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 15px;
            line-height: 1.2;
        }
        .sidebar p {
            font-size: 14px;
            line-height: 1.6;
            color: #e0e6ff;
            opacity: 0.9;
        }
        .sidebar-features {
            margin-top: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .feature-item {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .feature-icon {
            background: rgba(255,255,255,0.1);
            border-radius: 5px;
            padding: 8px;
            display: flex;
        }
        .feature-text h4 {
            margin: 0;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .feature-text p {
            margin: 2px 0 0 0;
            font-size: 11px;
        }

        /* Right Panel (Form) */
        .form-section {
            width: 65%;
            padding: 50px 60px;
            display: flex;
            flex-direction: column;
        }
        .form-section h3 {
            margin: 0 0 5px 0;
            font-size: 24px;
            color: var(--text-dark);
        }
        .form-section > p {
            margin: 0 0 30px 0;
            color: var(--text-gray);
            font-size: 14px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group.full-width {
            grid-column: span 2;
        }
        label {
            font-size: 11px;
            font-weight: 700;
            color: #555;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            padding: 12px 15px;
            border: 1px solid var(--input-border);
            border-radius: 6px;
            background-color: var(--input-bg);
            font-size: 14px;
            color: #333;
            transition: border-color 0.2s;
            outline: none;
        }
        input:focus, select:focus {
            border-color: var(--primary-blue);
            background-color: #fff;
        }

        /* Upload Area */
        .upload-area {
            border: 2px dashed #b0b8c4;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            background-color: #f8fafc;
            cursor: pointer;
            transition: all 0.2s;
            margin-bottom: 30px;
        }
        .upload-area:hover {
            border-color: var(--primary-blue);
            background-color: #f0f4f8;
        }
        .upload-icon {
            width: 30px;
            height: 30px;
            margin-bottom: 10px;
            opacity: 0.6;
        }
        .upload-text {
            font-size: 14px;
            font-weight: 600;
            color: var(--primary-blue);
            margin: 0 0 5px 0;
        }
        .upload-sub {
            font-size: 11px;
            color: var(--text-gray);
            margin: 0;
        }

        /* Buttons/Links */
        .btn-submit {
            width: 100%;
            background-color: var(--primary-blue);
            color: white;
            border: none;
            padding: 14px;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }
        .btn-submit:hover {
            background-color: var(--primary-blue-hover);
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: var(--text-gray);
        }
        .login-link a {
            color: #0056b3;
            text-decoration: none;
            font-weight: 600;
        }
        .login-link a:hover {
            text-decoration: underline;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            font-size: 11px;
            color: #888;
            font-weight: 500;
        }
        .footer-links {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .footer-links a {
            color: #888;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        #message {
            margin-top: 15px;
            font-size: 13px;
            text-align: center;
            font-weight: 500;
        }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>

    <header>
        <div class="logo">NirvachanSetu</div>
        <a href="#" class="support-link">Support</a>
    </header>

    <div class="main-wrapper">
        <div class="card">
            
            <!-- Left Sidebar -->
            <div class="sidebar">
                <h2>Join the Digital Bastion</h2>
                <p>Create your secure identity to participate in the democratic process. Your data is protected by sovereign-grade encryption.</p>
                
                <div class="sidebar-features">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path><polyline points="9 12 11 14 15 10"></polyline></svg>
                        </div>
                        <div class="feature-text">
                            <h4>Verified</h4>
                            <p>Official Election Portal</p>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                        </div>
                        <div class="feature-text">
                            <h4>Secure</h4>
                            <p>End-to-end encrypted data</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Form -->
            <div class="form-section">
                <h3>Create Account</h3>
                <p>Please provide your official details to register as a voter.</p>

                <form id="registerForm">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <input type="text" id="fullname" name="fullname" placeholder="As per citizenship ID" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="name@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="••••••••" required>
                        </div>
                        <div class="form-group">
                            <label for="citizenship">Citizenship Number</label>
                            <input type="text" id="citizenship" name="citizenship" placeholder="ID-000-000-000" required>
                        </div>
                        <div class="form-group full-width">
                            <label for="constituency">Constituency</label>
                            <select id="constituency" name="constituency" required>
                                <option value="" disabled selected>Select your registered constituency</option>
                                <option value="Jhapa-1">Jhapa-1</option>
                                <option value="Kathmandu-1">Kathmandu-1</option>
                                <option value="Lalitpur-2">Lalitpur-2</option>
                                <option value="Kaski-3">Kaski-3</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label>Legal Identification Proof</label>
                        <div class="upload-area">
                            <svg class="upload-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                            <p class="upload-text">Click to upload or drag and drop</p>
                            <p class="upload-sub">PDF, PNG or JPG (max. 10MB)</p>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">
                        Complete Registration
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                    </button>
                </form>

                <div id="message"></div>

                <div class="login-link">
                    Already have an account? <a href="login.jsp">Sign In</a>
                </div>
            </div>

        </div>
    </div>

    <footer>
        © 2024 NIRVACHANSETU • ELECTION COMMISSION OF THE BASTION
        <div class="footer-links">
            <a href="#">Privacy Protocol</a>
            <a href="#">Terms of Mandate</a>
            <a href="#">Accessibility</a>
        </div>
    </footer>

    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Processing...';
            messageDiv.className = '';

            const formData = new FormData(this);
            // Since your backend expects "username", we map the email to "username" dynamically
            const submitData = new URLSearchParams();
            submitData.append('username', formData.get('email'));
            submitData.append('password', formData.get('password'));

            fetch('${pageContext.request.contextPath}/api/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: submitData
            })
            .then(response => response.json().then(data => ({ status: response.status, body: data })))
            .then(res => {
                messageDiv.textContent = res.body.message;
                if (res.status === 201) {
                    messageDiv.classList.add('success');
                    document.getElementById('registerForm').reset();
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
