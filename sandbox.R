
url <- httr::parse_url("http://google.com/?bins")
url$query <- list("bins"=1, "other_setting"="This is another seetting??")
httr::build_url(url)


url <- httr::parse_url("http://127.0.0.1:5043")
#url$query <- list("bins"=1, "other_setting"="This is another seetting??")
url$query <- list("bins"=40,
                  "other_setting"="This is another seetting??",
                  "preloaded_dataset"="Growth KPIs (monthly)",
                  "filter___this"=1,
                  "filter___that"="Another value")
httr::build_url(url)


protocol <- "http:"
hostname <- "127.0.0.1"
port <- "5043"
url <- httr::parse_url(url = paste0(protocol, "//", hostname, ":", port))
httr::build_url(url)


# build url different way
protocol <- "http:"
hostname <- "127.0.0.1"
port <- "5043"
url_elements <- list(protocol=protocol, hostname=hostname, port=port)
attr(url_elements, 'class') <- 'url'
httr::build_url(url_elements)

url_elements <- list(protocol=session$clientData$url_protocol,
                     hostname=session$clientData$url_hostname,
                     pathname=session$clientData$url_pathname,
                     port=session$clientData$url_port,
                     search=session$clientData$url_search)
attr(url_elements, 'class') <- 'url'
httr::build_url(url_elements)


httr::build_url(url)


url <- httr::parse_url(url = "http://127.0.0.1:5043")
httr::build_url(url)

#url$query <- list("bins"=1, "other_setting"="This is another seetting??")
url$query <- list("bins"=40,
                  "other_setting"="This is another seetting??",
                  "preloaded_dataset"="Growth KPIs (monthly)",
                  "filter___this"=1,
                  "filter___that"="Another value")
httr::build_url(url)

####### Multi-Value Url parameters
mergeUrlArgs <- function(x) sapply(unique(names(x)), function(z) unlist(x[names(x) == z], use.names=FALSE), simplify=FALSE)
expandUrlArgs <- function(x) structure(do.call(c, lapply(x, function(z) as.list(z))), names=rep(names(x), sapply(x, length)))

myqueryString <- httr::parse_url("http://www.mysite.com/?a=1&a=2&b=val")$query
myqueryString
mergeUrlArgs(myqueryString)


#urlElements <- list(scheme="http",path="www.mysite.com/",query=list(a=c(1,2),b="val"))
url <- httr::parse_url(url = "http://127.0.0.1:5043")
my_url_list <- list(a=c(1, 2), b="val")
#url$query <- my_url_list
url$query <- expandUrlArgs(my_url_list)
httr::build_url(url)

