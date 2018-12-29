<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <h2>${msg("editAccountHtmlTtile")}</h2>

    <form action="${url.accountUrl}" class="pure-form pure-form-aligned" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <div class="pure-control-group">
            <label for="username">${msg("username")}<#if realm.editUsernameAllowed><span class="required">*</span></#if></label>
            <input type="text" id="username" name="username" class="pure-input-2-3" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
        </div>

        <div class="pure-control-group">
            <label for="email">${msg("email")}<span class="required">*</span></label>
            <input type="text" id="email" name="email" class="pure-input-2-3" autofocus value="${(account.email!'')}"/>
        </div>

        <div class="pure-control-group">
            <label for="firstName">${msg("firstName")}<span class="required">*</span></label>
            <input type="text" id="firstName" name="firstName" class="pure-input-2-3" value="${(account.firstName!'')}"/>
        </div>

        <div class="pure-control-group">
            <label for="lastName">${msg("lastName")}<span class="required">*</span></label>
            <input type="text" id="lastName" name="lastName" class="pure-input-2-3" value="${(account.lastName!'')}"/>
        </div>

        <div class="pure-control-group">
            <label></label>
            <button type="submit" class="pure-button pure-button-primary" name="submitAction" value="Save">${msg("doSave")}</button>
            <button type="submit" class="pure-button" name="submitAction" value="Cancel">${msg("doCancel")}</button>
            <span><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>

    </form>

</@layout.mainLayout>