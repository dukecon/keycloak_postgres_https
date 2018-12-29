<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <h2>${msg("changePasswordHtmlTitle")}</h2>

    <form action="${url.passwordUrl}" class="pure-form pure-form-aligned" method="post">
        <#if password.passwordSet>
            <div class="pure-control-group">
                <label for="password">${msg("password")}</label>
                <input type="password" id="password" name="password" class="pure-input-2-3" autofocus>
            </div>
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <div class="pure-control-group">
            <label for="password-new">${msg("passwordNew")}</label>
            <input type="password" id="password-new" name="password-new" class="pure-input-2-3">
        </div>

        <div class="pure-control-group">
            <label for="password-confirm">${msg("passwordConfirm")}</label>
            <input type="password" id="password-confirm" name="password-confirm" class="pure-input-2-3">
        </div>

        <div class="pure-control-group">
            <label></label>
            <button type="submit" class="pure-button pure-button-primary" name="submitAction" value="Save">${msg("doSave")}</button>
            <span>${msg("allFieldsRequired")}</span>
        </div>

    </form>

</@layout.mainLayout>