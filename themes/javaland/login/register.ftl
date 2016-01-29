<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.name!''))}
    <#elseif section = "header">
         ${msg("registerWithTitleHtml",(realm.name!''))}
    <#elseif section = "form">
        <form class="pure-form pure-form-aligned" action="${url.registrationAction}" method="post">
            
            <#if !realm.registrationEmailAsUsername>
            <div class="pure-control-group">
                <label for="username">${msg("username")}</label>
                <input type="text" id="username" name="username" value="${(register.formData.username!'')?html}" />
            </div>
            </#if>
            
            <div class="pure-control-group">
                <label for="firstName">${msg("firstName")}</label>
                <input type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')?html}" />
            </div>

            <div class="pure-control-group">
                <label for="lastName">${msg("lastName")}</label>
                <input type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')?html}" />
            </div>

            <div class="pure-control-group">
                <label for="email">${msg("email")}</label>
                <input type="text" id="email" name="email" value="${(register.formData.email!'')?html}" />
            </div>

            <#if passwordRequired>
            <div class="pure-control-group">
                <label for="password">${msg("password")}</label>
                <input type="password" id="password" name="password" />
            </div>

            <div class="pure-control-group">
                <label for="password-confirm">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" name="password-confirm" />
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="pure-control-group">
                <label></label>
                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
            </div>
            </#if>

            <div class="pure-control-group">
                <label></label>
                <input class="pure-button" type="submit" value="${msg("doRegister")}"/>
                <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
