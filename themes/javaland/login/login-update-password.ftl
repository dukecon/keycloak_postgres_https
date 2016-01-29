<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("updatePasswordTitle")}
    <#elseif section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form class="pure-form pure-form-aligned" action="${url.loginAction}" method="post">
            <div class="pure-control-group">
                <label for="password-new" >${msg("passwordNew")}</label>
                <input type="password" id="password-new" name="password-new" class="pure-input-2-3" autofocus />
            </div>

            <div class="pure-control-group">
                <label for="password-confirm" >${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" name="password-confirm" class="pure-input-2-3" />
            </div>

            <div class="pure-control-group">
                <label></label>
                <input class="pure-button pure-button-primary" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
