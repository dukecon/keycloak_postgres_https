<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <h2>${msg("sessionsHtmlTitle")}</h2>

    <table class="pure-table">
        <thead>
        <tr>
            <td>${msg("ip")}</td>
            <td>${msg("started")}</td>
            <td>${msg("lastAccess")}</td>
            <td>${msg("expires")}</td>
            <td>${msg("clients")}</td>
        </tr>
        </thead>

        <tbody>
        <#list sessions.sessions as session>
            <tr>
                <td>${session.ipAddress}</td>
                <td>${session.started?datetime}</td>
                <td>${session.lastAccess?datetime}</td>
                <td>${session.expires?datetime}</td>
                <td>
                    <#list session.clients as client>
                        ${client}<br/>
                    </#list>
                </td>
            </tr>
        </#list>
        </tbody>

    </table>

    <p>
        <a id="logout-all-sessions" href="${url.sessionsLogoutUrl}">${msg("doLogOutAllSessions")}</a>
    </p>

</@layout.mainLayout>
