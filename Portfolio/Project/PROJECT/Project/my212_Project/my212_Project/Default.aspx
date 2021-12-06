<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="my212_Project_32973934.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
    <style type="text/css">
    body{
        background-image:url(BloodOrange.png);
        background-size:coover;
        background-attachment: fixed;
    }
    .content{
        background:White;
        

    }

    </style>
    
    <link href="style.css" rel="stylesheet" />

    <div class="box">
        <link href="StyleSheet1.css" rel="stylesheet" />
    </div>
   

    
</head>
<body>
    <form id="form1" runat="server">


        <div class="login-wrap">
            <div class ="login-html">
                <input id ="tab-1" type="radio" name ="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for=tab-2" class ="tab">Sign Up</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <div class="group">
                            <label for="user" class="label">Username</label>
                            <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hint:&nbsp; Username: admin</div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <asp:TextBox ID="tb_pass" runat="server" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password: admin<br />
                       </div>
                        <div class="group">
                                  <asp:Button ID="btn_login" runat="server" Text="Login" OnClick ="btn_login_Click" />
                            </div>
            <div class="hr"></div>
            <div class ="foot-ink">
            <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label><br />
                </div>

            </div>
                <div class="sign-up-htm">
                    <div class="group">
                    </div>
                </div>
              </div>
            </div>


        
            <%-- Username: <asp:TextBox ID="tb_username" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="tb_pass" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msg" runat="server" Text="" ForeColor ="Red"></asp:Label><br />
            <asp:Button ID="btn_login" runat="server" Text="Login" OnClick ="btn_login_Click" />--%>
            <br /><br />
            
            Sign Up for Student(only) : <br />

            Fullname: <asp:TextBox ID="tb_fullname" runat="server"></asp:TextBox><br />
            Username: <asp:TextBox ID="tb_usernameS" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="tb_passS" runat="server"></asp:TextBox><br />
            
            <asp:Label ID="lb_ms2" runat="server" Text="" ForeColor ="Red"></asp:Label><br />
            <asp:Button ID="btn_signup" runat="server" Text="Sign UP" OnClick ="btn_signup_Click" />

        </div>
    </form>
</body>
</html>
