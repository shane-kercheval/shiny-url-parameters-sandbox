
url <- httr::parse_url("http://127.0.0.1:3158")
# url$query <- list("bins"=1, "other_setting"="This is another seetting??")
# httr::build_url(url)
url$query <- list("data"="Insurance",
                  "tab"="Graphs",
                  "variable"="bmi",
                  "plot_title"="My Title From the URL")
httr::build_url(url)


url <- httr::parse_url("http://127.0.0.1:3158")
# url$query <- list("bins"=1, "other_setting"="This is another seetting??")
# httr::build_url(url)
url$query <- list("data"="Flights",
                  "tab"="Graphs",
                  "custom_title"="This is my title from URL parameter",
                  "variable"="date",
                  "comparison"="arr_delay",
                  "color_variable"="dest",
                  "facet_variable"="origin",
                  "ts_date_floor"="month")
httr::build_url(url)
nchar(httr::build_url(url))
                  # 'filter_factor_lump_number' = 'as.character(c("Off", seq(1, 10), seq(15, 50, 5))), selected="10")',
                  # 'label_variables' = 'character(0))',
                  # 'annotate_points' = 'FALSE)',
                  # 'show_points' = 'FALSE)',
                  # 'year_over_year' = 'FALSE)',
                  # 'include_zero_y_axis' = 'TRUE)',
                  # 'numeric_graph_type' = '"Boxplot")',
                  # 'categoric_view_type' = '"Bar")',
                  # 'order_by_variable' = '"Default")',
                  # 'show_variable_totals' = 'TRUE)',
                  # 'show_comparison_totals' = 'TRUE)',
                  # 'histogram_bins' = '30)',
                  # 'transparency' = '60)',
                  # 'jitter' = 'FALSE)',
                  # 'numeric_aggregation_count_minimum' = '30)',
                  # 'numeric_show_resampled_conf_int' = 'FALSE)',
                  # 'trend_line' = 'None)',
                  # 'trend_line_se' = 'Yes)',
                  # 'ts_date_floor' = 'names(global__date_part_vector)[1])',
                  # 'ts_date_break_format' = 'names(global__date_break_format_vector)[1])',
                  # 'ts_breaks_width' = 'integer(0))',
                  # 'scale_x_log_base_10' = 'FALSE)',
                  # 'x_zoom_min' = 'integer(0))',
                  # 'x_zoom_max' = 'integer(0))',
                  # 'scale_y_log_base_10' = 'FALSE)',
                  # 'y_zoom_min' = 'integer(0))',
                  # 'y_zoom_max' = 'integer(0))',
                  # 'custom_title' = "var_plots__custom_titlevar_plots__custom_title",
                  # 'custom_subtitle' = "var_plots__custom_subtitlevar_plots__custom_subtitle",
                  # 'custom_x_axis_label' = "var_plots__custom_x_axis_labelvar_plots__custom_x_axis_label",
                  # 'custom_y_axis_label' = "var_plots__custom_y_axis_labelvar_plots__custom_y_axis_label",
                  # 'custom_caption' = "var_plots__custom_captionvar_plots__custom_caption",
                  # 'custom_tag' = "var_plots__custom_tagvar_plots__custom_tag",
                  # 'base_size' = "var_plots__base_sizevar_plots__base_size",
                  # 'vertical_annotations' = "var_plots__vertical_annotationsvar_plots__vertical_annotations",
                  # 'horizontal_annotations' = "var_plots__horizontal_annotationsvar_plots__horizontal_annotations",
                  # 'pretty_text' = "var_plots__pretty_textvar_plots__pretty_text")




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



my_list <- list("var_plots__asdf"=1, "dddd"=2, "var_plots__ffff"=3)
my_list[grep("var_plots__", names(my_list))]

c(my_list, list("another"="a"))
