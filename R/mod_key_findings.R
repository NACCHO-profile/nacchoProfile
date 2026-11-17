#' key_findings UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
mod_key_findings_ui <- function(id){
  ns <- NS(id)
  tagList(
    conditionalPanel(
      condition = "input.tabs == 'key_findings_tab'",
      div(
        openMenu(),
        div(
          class = "key-findings-head",
          div(
            class = "row",
            div(
              class = "col-sm-8",
              align = "left",
              h1("Key Findings"),
              hr(class = "header-hr")
            ),
            div(
              class = "col-sm-3 findings-align",
              actionLink(class = "download-input link-no-underline",
                         inputId = ns("download"),
                         "Download Key Findings"
              )
            )
          )
        ),
        div(
          class = "key-findings-content",

          # carousel
          bsutils::carousel(
            indicators = FALSE,
            controls = TRUE,
            class = "carousel-dark alt-2",
            bsutils::carouselItem(
              bslib::card(
                height = "80vh",
                class = "key-findings-cards",
                bslib::card_header(
                  fill = FALSE
                ),
                bslib::card_body(
                  highcharter::highchartOutput(ns("finding_one"))
                )
              ),
              interval = 60000L
            ),
            bsutils::carouselItem(
              bslib::card(
                height = "80vh",
                class = "key-findings-cards",
                bslib::card_header(
                  fill = FALSE
                ),
                bslib::card_body(
                  highcharter::highchartOutput(ns("finding_two"))
                )
              ),
              interval = 60000L
            ),
            bsutils::carouselItem(
              bslib::card(
                height = "80vh",
                class = "key-findings-cards",
                bslib::card_header(
                  fill = FALSE
                ),
                bslib::card_body(
                  highcharter::highchartOutput(ns("finding_three"))
                )
              ),
              interval = 60000L
            ),
            bsutils::carouselItem(
              bslib::card(
                height = "80vh",
                class = "key-findings-cards",
                bslib::card_header(
                  fill = FALSE
                ),
                bslib::card_body(
                  highcharter::highchartOutput(ns("finding_four"))
                )
              ),
              interval = 60000L
            )
          ),

          # modal for key findings download
          bsutils::modal(
            id = ns("modal"),
            bsutils::modalHeader(
              bsutils::modalTitle(
                p(strong("What do you want to download?"))
              )
            ),
            bsutils::modalBody(
              br(),
              downloadLink(
                outputId = ns("download_slides"),
                label = p("Download a PowerPoint of our Key Findings.")
              ),
              br(),
              downloadLink(
                outputId = ns("download_pdf"),
                label = p("Download a PDF of our Key Findings slide deck.")
              )
            )
          )
        )
      )
    )
  )
}

#' key_findings Server Functions
#'
#' @noRd
mod_key_findings_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # modal
    observeEvent(
      input$download,
      bsutils::modal_show(ns("modal"))
    )

    # Download PowerPoint
    output$download_slides <- downloadHandler(
      filename = function() {
        "Profile2025KeyFindings.pptx"
      },
      content = function(file) {
        # Use app_sys to locate the file in the `www` folder
        file.copy(app_sys("app/www/Profile2025KeyFindings.pptx"), file)
      }
    )

    # Download PDF
    output$download_pdf <- downloadHandler(
      filename = function() {
        "Profile2025KeyFindings.pdf"
      },
      content = function(file) {
        # Use app_sys to locate the file in the `www` folder
        file.copy(app_sys("app/www/Profile2025KeyFindings.pdf"), file)
      }
    )

    # Finding One - Changes in Programs and Services ----------------------

    output$finding_one <- highcharter::renderHighchart({

      # Data from 2025 Profile
      data <- data.frame(
        service = c(
          "Immunization",
          "Maternal and child health services",
          "High blood pressure screening",
          "Blood lead screening",
          "Communicable disease",
          "Chronic disease",
          "Diabetes screening",
          "Substance use prevention",
          "Mental health",
          "Environmental health",
          "Epidemiology and surveillance",
          "Emergency preparedness",
          "Obesity prevention"
        ),

        reduced = c(
          11, 6, 6, 4, 6, 5, 7,
          3, 5, 3, 6, 4, 5
        ),

        expanded = c(
          21, 21, 19, 18, 18, 15, 15,
          30, 25, 19, 16, 16, 9
        ),

        category = c(
          rep("Clinical services", 7),
          rep("Population-based services", 6)
        )
      )

      # Preserve original service order
      data$service <- factor(
        data$service,
        levels = data$service
      )

      # Color palette
      clinical_color <- naccho.viz::navy
      population_color <- naccho.viz::green

      # Build dumbbell chart
      chart <- highcharter::highchart() %>%
        highcharter::hc_add_theme(naccho.viz::basic) %>%
        highcharter::hc_chart(
          type = "scatter",
          inverted = TRUE
        ) %>%
        highcharter::hc_title(
          text = paste0(
            "Most services provided by local health departments remained relatively ",
            "stable, with an average of 19% reporting expansions and 5% reporting ",
            "reductions across services."
          )
        ) %>%

        highcharter::hc_subtitle(
          useHTML = TRUE,
          align = "center",
          text = paste0(
            "Expansions were more common than reductions. Some ",
            "<span style='color:", naccho.viz::green,
            "; font-weight:bold;'>population-based services</span> ",
            "showed particularly high levels of expansion, including ",
            "substance use prevention and mental health."
          ),
          style = list(
            textAlign = "center",
            lineHeight = "1.2"
          )
        ) %>%
        highcharter::hc_xAxis(
          categories = as.character(data$service),
          reversed = TRUE,
          title = list(text = NULL),
          labels = list(
            style = list(
              fontFamily = "Heebo",
              fontSize = "12px"
            )
          )
        ) %>%
        highcharter::hc_yAxis(
          min = 0,
          max = 35,
          tickInterval = 5,
          endOnTick = TRUE,
          title = list(
            text = "",
            enabled = FALSE
          ),
          labels = list(
            format = "{value}%"
          )
        ) %>%
        highcharter::hc_tooltip(
          shared = FALSE,
          pointFormat = "{point.name}: {point.y}%"
        ) %>%
        highcharter::hc_plotOptions(
          series = list(
            events = list(
              legendItemClick = highcharter::JS(
                "function() { return false; }"
              )
            )
          )
        )

      # Add connector lines and endpoints
      for (i in seq_len(nrow(data))) {

        row <- data[i, ]

        color <- if (row$category == "Clinical services") {
          clinical_color
        } else {
          population_color
        }

        position <- i - 1L

        # Connector line
        chart <- chart %>%
          highcharter::hc_add_series(
            type = "line",
            data = list(
              list(x = position, y = row$reduced),
              list(x = position, y = row$expanded)
            ),
            color = color,
            lineWidth = 2,
            marker = list(enabled = FALSE),
            enableMouseTracking = FALSE,
            showInLegend = FALSE
          )

        # Reduced point
        chart <- chart %>%
          highcharter::hc_add_series(
            type = "scatter",
            name = "Reduced",
            data = list(
              list(
                x = position,
                y = row$reduced,
                name = as.character(row$service)
              )
            ),
            color = color,
            marker = list(
              symbol = "circle",
              radius = 5,
              fillColor = "#FFFFFF",
              lineColor = color,
              lineWidth = 2
            ),
            showInLegend = i == 1
          )

        # Expanded point
        chart <- chart %>%
          highcharter::hc_add_series(
            type = "scatter",
            name = "Expanded",
            data = list(
              list(
                x = position,
                y = row$expanded,
                name = as.character(row$service)
              )
            ),
            color = color,
            marker = list(
              symbol = "circle",
              radius = 6,
              fillColor = color,
              lineColor = color,
              lineWidth = 1
            ),
            showInLegend = i == 1
          )
      }

      chart %>%
        highcharter::hc_add_theme(naccho.viz::basic) %>%

        # Remove default axis title ("Values")
        highcharter::hc_yAxis(
          title = list(
            text = NULL
          )
        ) %>%

        # Adjust chart spacing
        highcharter::hc_chart(
          type = "scatter",
          inverted = TRUE,
          marginLeft = 280,
          marginBottom = 130
        ) %>%

        # Place percentage label above the legend
        highcharter::hc_caption(
          text = "% of LHDs",
          align = "center",
          verticalAlign = "bottom",
          y = -45,
          style = list(
            fontFamily = "Heebo",
            fontSize = "12px",
            fontWeight = "500"
          )
        ) %>%

        # Place legend underneath percentage label
        highcharter::hc_legend(
          enabled = TRUE,
          align = "center",
          verticalAlign = "bottom",
          floating = TRUE,
          y = -5,
          itemStyle = list(
            cursor = "default"
          )
        ) %>%

        # Prevent legend clicks
        highcharter::hc_plotOptions(
          series = list(
            events = list(
              legendItemClick = highcharter::JS(
                "function() { return false; }"
              )
            )
          )
        ) %>%

        highcharter::hc_exporting(
          enabled = FALSE
        )

    })

    # finding two - LBOH authority by rurality -------------------------------
    output$finding_two <- highcharter::renderHighchart({

      data <- data.frame(
        rurality = rep(c("Rural", "Urban"), each = 10),

        authority = rep(
          c(
            "Advise on Policies, Programs, & Budgets",
            "Set Policies, Goals, & Priorities",
            "Approve Agency Budget",
            "Adopt Public Health Regulations",
            "Set/Impose Fees",
            "Hire/Fire Agency Head",
            "Impose Quarantine/Isolation Orders",
            "Request Public Health Levy",
            "Impose Taxes",
            "None or No LBOH"
          ),
          times = 2
        ),

        perc = c(
          # Rural
          81, 75, 81, 68, 66, 69, 50, 45, 22, 23,

          # Urban
          82, 73, 61, 71, 68, 57, 48, 31, 18, 23
        )
      )

      data$rurality <- factor(
        data$rurality,
        levels = c("Rural", "Urban")
      )

      data$rurality_tt <- tolower(as.character(data$rurality))
      data$authority_tt <- tolower(data$authority)

      # Keep authorities in the specified order within each rurality group
      authority_order <- c(
        "Advise on Policies, Programs, & Budgets",
        "Set Policies, Goals, & Priorities",
        "Approve Agency Budget",
        "Adopt Public Health Regulations",
        "Set/Impose Fees",
        "Hire/Fire Agency Head",
        "Impose Quarantine/Isolation Orders",
        "Request Public Health Levy",
        "Impose Taxes",
        "None or No LBOH"
      )

      data <- data %>%
        dplyr::mutate(
          authority = factor(authority, levels = authority_order)
        ) %>%
        dplyr::arrange(rurality, authority)

      naccho.viz::create_grouped_bar(
        data = data,
        x_variable = "rurality",
        y_variable = "perc",

        title_text = paste0(
          "While rural and urban local health departments are similarly likely to have a
          local board of health (LBOH), there are differences in their final authorities."
        ),

        subtitle_text = paste0(
          "Rural health departments are more likely to have LBOHs with final
          authority to <span style='color:", naccho.viz::navy,
          "; font-weight:bold;'>approve budgets</span>, ",
          "<span style='color:", naccho.viz::green,
          "; font-weight:bold;'>hire/fire agency heads</span>, and ",
          "<span style='color:", naccho.viz::navy,
          "; font-weight:bold;'>request levies</span>."
        ),

        x_group = "authority",
        y_label = "",
        y_max = 100,
        y_format = "{value}%",
        legend_enable = TRUE,
        legend_title = "",

        tooltip = paste0(
          "{point.perc:,.0f}% of {point.rurality_tt} LHDs ",
          "reported LBOH authority for: <br>",
          "{point.authority_tt}"
        ),

        allow_export = FALSE,
        select_theme = naccho.viz::basic
      ) %>%
        (\(chart) {
          chart$x$hc_opts$series <- lapply(
            chart$x$hc_opts$series,
            function(s) {
              if (identical(as.character(s$name), "None or No LBOH")) {
                s$color <- naccho.viz::grey
              }
              s
            }
          )
          chart
        })() %>%
        highcharter::hc_plotOptions(
          series = list(
            dataLabels = list(
              enabled = TRUE,
              overflow = "allow",
              align = "center",
              style = list(
                fontWeight = "500",
                fontSize = "1.2em",
                fontFamily = "Heebo",
                textOutline = "none"
              ),
              format = "{point.perc:.0f}%",
              formatter = highcharter::JS(
                "function() {
              return this.y + '%';
            }"
              )
            )
          )
        ) %>%
        highcharter::hc_add_theme(naccho.viz::basic) %>%
        (\(chart) {
          chart$dependencies <- Filter(
            function(dep) {
              !grepl("accessibility", dep$name, ignore.case = TRUE)
            },
            chart$dependencies
          )
          chart
        })()

    })



    # finding three - policymaking over time -------------------------------
    output$finding_three <- highcharter::renderHighchart({

      # Data
      data <- data.frame(
        year = rep(c("2016", "2019", "2022", "2025"), 10),

        policy_area = rep(
          c(
            "Tobacco, alcohol, or other drugs",
            "Emergency preparedness and response",
            "Infectious disease",
            "Food safety",
            "Mental health",
            "Safe and healthy housing",
            "Funding for access to health care",
            "Extreme weather and health",
            "Oral health",
            "Injury and violence prevention"
          ),
          each = 4
        ),

        perc = c(
          74, 74, 52, 58,  # Tobacco, alcohol, or other drugs
          72, 62, 61, 62,  # Emergency preparedness
          68, 60, 57, 58,  # Infectious disease
          57, 48, 45, 43,  # Food safety
          27, 32, 33, 33,  # Mental health
          23, 25, 25, 25,  # Safe and healthy housing
          27, 22, 18, 21,  # Funding for access to health care
          NA, 7, 10, 11,  # Climate change (not measured in 2016)
          31, 27, 19, 22,  # Oral health
          29, 27, 22, 23   # Injury and violence prevention
        )
      )

      # Set year and policy area order
      data$year <- factor(
        data$year,
        levels = c("2016", "2019", "2022", "2025")
      )

      data$policy_area <- factor(
        data$policy_area,
        levels = unique(data$policy_area)
      )

      # Calculate change since the previous survey
      data <- data %>%
        dplyr::group_by(policy_area) %>%
        dplyr::arrange(year, .by_group = TRUE) %>%
        dplyr::mutate(
          previous_year = dplyr::lag(as.character(year)),
          previous_perc = dplyr::lag(perc),

          # Percentage-point change
          pp_change = perc - previous_perc,

          # Relative percent change
          pct_change = dplyr::if_else(
            is.na(previous_perc) | previous_perc == 0,
            NA_real_,
            (perc - previous_perc) / previous_perc * 100
          )
        ) %>%
        dplyr::ungroup()

      # Four NACCHO highlight colors
      hover_colors <- rep(
        c(
          naccho.viz::navy,
          naccho.viz::green,
          naccho.viz::terracotta,
          naccho.viz::pink
        ),
        length.out = 10
      )

      # Build each series explicitly so tooltip metadata
      # and individual hover colors are preserved
      policy_levels <- levels(data$policy_area)

      series_list <- lapply(
        seq_along(policy_levels),
        function(i) {

          policy_data <- data %>%
            dplyr::filter(
              policy_area == policy_levels[i]
            ) %>%
            dplyr::arrange(year)

          # Create data points for each policy area
          points <- lapply(
            seq_len(nrow(policy_data)),
            function(j) {

              list(
                x = as.numeric(j - 1),

                # Missing values are displayed as gaps
                y = if (is.na(policy_data$perc[j])) {
                  NULL
                } else {
                  as.numeric(policy_data$perc[j])
                },

                survey_year = as.character(policy_data$year[j]),

                previous_year = if (
                  is.na(policy_data$previous_year[j])
                ) "" else as.character(policy_data$previous_year[j]),

                pp_change = if (
                  is.na(policy_data$pp_change[j])
                ) NULL else as.numeric(policy_data$pp_change[j]),

                pct_change = if (
                  is.na(policy_data$pct_change[j])
                ) NULL else as.numeric(policy_data$pct_change[j]),

                is_missing = is.na(policy_data$perc[j])
              )
            }
          )

          list(
            name = policy_levels[i],
            type = "line",
            data = points,

            # Gray when not hovered
            color = "#B8BEC5",

            lineWidth = 2,

            marker = list(
              enabled = TRUE,
              radius = 4,
              symbol = "circle"
            ),

            # Each series gets a NACCHO hover color
            hoverColor = hover_colors[i],

            states = list(
              hover = list(
                enabled = TRUE,
                lineWidth = 4,
                halo = list(size = 0)
              ),
              inactive = list(
                enabled = FALSE
              )
            ),

            events = list(
              legendItemClick = highcharter::JS(
                "function() {
      var series = this;
      var selected = !series.userOptions.isSelected;

      series.update({
        isSelected: selected,
        color: selected
          ? series.userOptions.hoverColor
          : '#B8BEC5',
        lineWidth: selected ? 4 : 2
      }, false);

      series.chart.redraw();

      // Prevent the default behavior of hiding the series
      return false;
    }"
              ),

              mouseOver = highcharter::JS(
                "function() {
      if (!this.userOptions.isSelected) {
        this.update({
          color: this.userOptions.hoverColor,
          lineWidth: 4
        }, false);
        this.chart.redraw();
      }
    }"
              ),

              mouseOut = highcharter::JS(
                "function() {
      if (!this.userOptions.isSelected) {
        this.update({
          color: '#B8BEC5',
          lineWidth: 2
        }, false);
        this.chart.redraw();
      }
    }"
              )
            )
            )
        }
      )

      # Create chart
      hc <- highcharter::highchart() %>%
        highcharter::hc_add_theme(
          naccho.viz::basic
        ) %>%

        # Title
        highcharter::hc_title(
          text = paste0(
            "Local health department involvement in policymaking
            has shifted across public health areas since 2016."
          )
        ) %>%


        # Subtitle with highlighted policy areas
        highcharter::hc_subtitle(
          useHTML = TRUE,
          text = paste0(
            "Involvement has declined in areas such as ",
            "<span style='color:", naccho.viz::navy,
            "; font-weight:bold;'>substance use</span> and ",
            "<span style='color:", naccho.viz::pink,
            "; font-weight:bold;'>food safety</span>. Meanwhile,
            involvement has increased in <span style='color:", naccho.viz::navy,
            "; font-weight:bold;'>mental health</span> and ",
            "<span style='color:", naccho.viz::pink,
            "; font-weight:bold;'>extreme weather and health</span>."
          ),
          style = list(
            fontSize = "13px",
            lineHeight = "18px",
            width = "90%"
          )
        ) %>%

        # Reserve enough space for the multiline subtitle
        highcharter::hc_chart(
          marginTop = 170
        ) %>%

        # X-axis
        highcharter::hc_xAxis(
          title = list(text = ""),
          categories = c("2016", "2019", "2022", "2025")
        ) %>%

        # Y-axis
        highcharter::hc_yAxis(
          title = list(text = "% of LHDs"),
          min = 0,
          max = 80,
          labels = list(
            format = "{value}%"
          )
        ) %>%

        # Line options
        highcharter::hc_plotOptions(
          line = list(
            lineWidth = 2,
            stickyTracking = TRUE,

            marker = list(
              enabled = TRUE,
              radius = 4,
              symbol = "circle"
            ),

            states = list(
              inactive = list(
                enabled = FALSE
              )
            )
          )
        ) %>%

        # Tooltip with both types of change
        highcharter::hc_tooltip(
          shared = FALSE,
          useHTML = TRUE,
          backgroundColor = "#FFFFFF",
          borderColor = "#D9D9D9",
          borderWidth = 1,
          borderRadius = 6,
          shadow = FALSE,

          formatter = highcharter::JS(
            "function() {

          var p = this.point;
          var html =
            '<b>' + this.series.name + '</b><br>' +
            p.options.survey_year + ': <b>' +
            Highcharts.numberFormat(this.y, 0) +
            '% of LHDs</b>';

          if (p.options.pp_change === undefined ||
              p.options.pp_change === null) {

            html += '<br>First available survey year';

          } else {

            var pp = p.options.pp_change;
            var pct = p.options.pct_change;

            var ppSign = pp > 0 ? '+' : '';
            var pctSign = pct > 0 ? '+' : '';

            html +=
              '<br><br><b>Change since ' +
              p.options.previous_year + ':</b>' +
              '<br>' + ppSign +
              Highcharts.numberFormat(pp, 0) +
              ' percentage points';

            if (pct !== undefined && pct !== null) {
              html +=
                '<br>' + pctSign +
                Highcharts.numberFormat(pct, 1) +
                '% relative change';
            }
          }

          return html;
        }"
          )
        ) %>%

        # Legend
        highcharter::hc_legend(
          enabled = TRUE,
          layout = "horizontal",
          align = "center",
          verticalAlign = "bottom",
          itemStyle = list(
            fontFamily = "Heebo",
            fontSize = "12px"
          )
        ) %>%

        # Disable exporting
        highcharter::hc_exporting(
          enabled = FALSE
        )

      # Add all ten policy area series
      for (i in seq_along(series_list)) {

        series <- series_list[[i]]

        hc <- highcharter::hc_add_series(
          hc,
          name = series$name,
          type = "line",
          data = series$data,
          color = series$color,
          hoverColor = series$hoverColor,
          lineWidth = series$lineWidth,
          marker = series$marker,
          states = series$states,
          events = series$events
        )
      }

      # Remove problematic accessibility dependency
      hc$dependencies <- Filter(
        function(dep) {
          !grepl(
            "accessibility",
            dep$name,
            ignore.case = TRUE
          )
        },
        hc$dependencies
      )

      # Return chart
      hc

    })




    # informatics -------------------------------------------------------------
    output$finding_four <- highcharter::renderHighchart({

      data <- data.frame(
        year = c(2008, 2010, 2013, 2016, 2019, 2022, 2008, 2010, 2013, 2016, 2019, 2022),
        type = c("Electronic Health Records",
                 "Electronic Health Records",
                 "Electronic Health Records",
                 "Electronic Health Records",
                 "Electronic Health Records",
                 "Electronic Health Records",
                 "Health Information Exchanges",
                 "Health Information Exchanges",
                 "Health Information Exchanges",
                 "Health Information Exchanges",
                 "Health Information Exchanges",
                 "Health Information Exchanges"),
        value = c(19, 19, 23, 37, 59, 61,
                  8, 6, 14, 17, 21, 32)
      )

      data$year <- factor(data$year)
      data$type_tt <- tolower(data$type)

      naccho.viz::create_grouped_line(
        data = data,
        x_variable = "year",
        y_variable = "value",

        title_text = "Implementation of <span style='color:#AB6143;font-weight:bold;'>electronic health records</span> increased by 42 percentage points between 2008 and 2022.",

        subtitle_text = paste0(
          "Participation in <span style='color:", naccho.viz::green,
          "; font-weight:bold;'>health information exchanges</span>",
          " increased 24 percentage points over the same period."
        ),

        x_group = "type",
        y_label = "% of LHDs",
        my_colors = c(naccho.viz::terracotta, naccho.viz::green),
        y_format = "{value}\u0025",
        legend_enable = TRUE,
        legend_title = "",
        x_label = "",
        tooltip = "{point.value:,.0f}\u0025 of LHDs had implemented <br> {point.type_tt} in {point.year}",
        allow_export = FALSE
      ) %>%
        highcharter::hc_add_theme(naccho.viz::basic) %>%
        (\(chart) {
          chart$dependencies <- Filter(
            function(dep) {
              !grepl("accessibility", dep$name, ignore.case = TRUE)
            },
            chart$dependencies
          )
          chart
        })()

    })  # Closes output$finding_four

  })  # Closes moduleServer

}   # Closes mod_key_findings_server

## To be copied in the UI
# mod_key_findings_ui("key_findings_1")

## To be copied in the server
# mod_key_findings_server("key_findings_1")
