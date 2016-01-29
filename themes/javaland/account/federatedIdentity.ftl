<#import "template.ftl" as layout>
<@layout.mainLayout active='social' bodyClass='social'; section>

    <h2>${msg("federatedIdentitiesHtmlTitle")}</h2>

    <form action="${url.passwordUrl}" class="pure-form pure-form-aligned" method="post">
        <#list federatedIdentity.identities as identity>
            <div class="pure-control-group">
                <label for="${identity.providerId!}">${identity.providerName!}</label>
                <input disabled="true" value="${identity.userName!}">
                <span>
                    <#if identity.connected>
                        <#if federatedIdentity.removeLinkPossible>
                            <a href="${identity.actionUrl}" type="submit" id="remove-${identity.providerId!}" class="pure-button">${msg("doRemove")}</a>
                        </#if>
                    <#else>
                        <a href="${identity.actionUrl}" type="submit" id="add-${identity.providerId!}" class="pure-button pure-button-primary">${msg("doAdd")}</a>
                    </#if>
                </span>
            </div>
        </#list>
    </form>

</@layout.mainLayout>