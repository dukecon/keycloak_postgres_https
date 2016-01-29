<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form class="pure-form pure-form-aligned" action="${url.loginAction}" method="post">
            <div class="pure-control-group">
                <label for="username" >${msg("usernameOrEmail")}</label>
                <input type="text" id="username" name="username" class="pure-input-2-3" autofocus/>
            </div>

            <div class="pure-control-group">
                <input class="pure-button pure-button-primary" type="submit" value="${msg("doSubmit")}"/>
                <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
            </div>
        </form>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
