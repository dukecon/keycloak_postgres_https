<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, minimum-scale=1.0">
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
<div class="header">
    <h1 id="headertitle">
        <a id="logo" href="#">
            <img src="${url.resourcesPath}/img/logo_javaland.gif" title="Javaland 2016"/>
        </a>
        <span id="pagetitle"><#nested "header"></span>
        <div><#nested "header">&nbsp;</div>
    </h1>
</div>
<div class="content">
    <h2><#nested "header"></h2>

    <div class="pure-g">

        <div class="pure-u-1 pure-u-md-1-2">

            <#if displayMessage && message?has_content>
                <p class="feedback-${message.type}">${message.summary}</p>
            </#if>

            <#nested "form">

            <#if realm.internationalizationEnabled>
                <div>
                    <a href="#">${locale.current}</a>
                    <ul>
                        <#list locale.supported as l>
                            <li><a href="${l.url}">${l.label}</a></li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
        <div class="pure-u-1 pure-u-md-1-2">
            <#if displayInfo>
                <div><#nested "info"></div>
            </#if>
        </div>

    </div>

</div>

</body>
</html>
</#macro>
