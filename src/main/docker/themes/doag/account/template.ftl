<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=1.0">
    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body>
<div class="header">
    <h1 id="headertitle">
        <a id="logo" href="#">
            <img src="${url.resourcesPath}/img/logo_javaland.gif" title="Javaland 2016"/>
        </a>
        <span id="pagetitle">Keycloak</span>
        <div>Keycloak&nbsp;</div>
    </h1>
</div>
<div id="layout" class="content">
    <!-- Menu toggle -->
    <a href="#menu" id="menuLink" class="menu-link">
        <!-- Hamburger icon -->
        <span></span>
    </a>

    <div id="menu">
        <div class="pure-menu">
            <span class="pure-menu-heading">Menu</span>
            <ul class="pure-menu-list">
                <li class="pure-menu-item <#if active=='account'>pure-menu-selected</#if>"><a href="${url.accountUrl}" class="pure-menu-link">${msg("account")}</a></li>
                <#if features.passwordUpdateSupported><li class="pure-menu-item <#if active=='password'>pure-menu-selected</#if>"><a href="${url.passwordUrl}" class="pure-menu-link">${msg("password")}</a></li></#if>
                <#if features.identityFederation><li class="pure-menu-item <#if active=='social'>pure-menu-selected</#if>"><a href="${url.socialUrl}" class="pure-menu-link">${msg("federatedIdentity")}</a></li></#if>
                <li class="pure-menu-item <#if active=='sessions'>pure-menu-selected</#if>"><a href="${url.sessionsUrl}" class="pure-menu-link">${msg("sessions")}</a></li>
                <#if features.log><li class="pure-menu-item <#if active=='log'>pure-menu-selected</#if>"><a href="${url.logUrl}" class="pure-menu-link">${msg("log")}</a></li></#if>

                <#if referrer?has_content && referrer.url?has_content><li><a href="${referrer.url}" id="referrer" class="pure-menu-link">${msg("backTo",referrer.name)}</a></li></#if>
                <li class="pure-menu-item"><a href="${url.logoutUrl}" class="pure-menu-link">${msg("doSignOut")}</a></li>
            </ul>
        </div>
    </div>

    <div id="main">
        <#if message?has_content>
            <div class="feedback-${message.type}">
            ${message.summary}
            </div>
        </#if>

        <#nested "content">
    </div>
</div>
<script type="text/javascript" src="${url.resourcesPath}/js/ui.js"></script>
</body>
</html>
</#macro>