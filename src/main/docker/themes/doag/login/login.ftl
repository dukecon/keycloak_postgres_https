<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.name!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.name!''))}
    <#elseif section = "form">
        <#if realm.password>
            <form action="${url.loginAction}" method="post" class="pure-form pure-form-aligned">

                <!-- TODO: Clean this up! -->
                <div class="pure-control-group"><em>Please use your Javaland user account. If you have not yet registered, please visit<br>
                    <a href="https://www.javaland.eu/de/login/registrierung/">the Javaland registration page</a>.<br>
                    Come back here after successful registration.</em></div>
                <div class="pure-control-group">
                    <label for="username">${msg("username")}</label>
                    <#if usernameEditDisabled??>
                        <input id="username" name="username" class="pure-input-2-3" value="${(login.username!'')?html}" type="text" disabled />
                    <#else>
                        <input id="username" name="username" class="pure-input-2-3" value="${(login.username!'')?html}" type="text" autofocus />
                    </#if>
                </div>
                <div class="pure-control-group">
                    <label for="password">${msg("password")}</label>
                    <input id="password" name="password" class="pure-input-2-3" type="password" />
                </div>

                <div class="pure-control-group">
                    <label></label>
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <#if login.rememberMe??>
                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                        <#else>
                            <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                        </#if>
                    </#if>
                </div>

                <div class="pure-control-group">
                    <label></label>
                    <input class="pure-button pure-button-primary" name="login" type="submit" value="${msg("doLogIn")}"/>
                    <#if realm.resetPasswordAllowed>
                        <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                    </#if>
                </div>

            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div>
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <p>
                Login with:
                <ul class="social">
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.alias}</span></a></li>
                    </#list>
                </ul>
            </p>
        </#if>
    </#if>
</@layout.registrationLayout>
