x <- y <- area <- PANEL <- NULL

setup_data <- function(data, params, self = self) {
  default_aes <- names(ggplot2::GeomCol$default_aes)
  ggplot2::ggproto_parent(ggplot2::GeomCol, self)$setup_data(data, params) |>
    ggplot2::flip_data(params$flipped_aes) |>
    dplyr::group_by(x, PANEL, dplyr::pick(dplyr::any_of(default_aes))) |>
    dplyr::summarise(
      area = list(y),
      dplyr::across(dplyr::starts_with("y"), sum),
      dplyr::across(dplyr::starts_with("subgroup"), list),
      dplyr::across(
        !(area | dplyr::starts_with("y") | dplyr::starts_with("subgroup")),
        \(x) x[1]
      ),
      .groups = "drop"
    ) |>
    ggplot2::flip_data(params$flipped_aes)
}

draw_panel <- function(data, panel_params, coord, lineend = "butt",
                       linejoin = "mitre", width = NULL, flipped_aes = FALSE,
                       fixed = NULL, layout = "squarified", start = "bottomleft",
                       self = self) {
  data <- coord$transform(data, panel_params)
  treemaps <- apply(data, MARGIN = 1L, simplify = FALSE, FUN = function(data) {
    data <- as.data.frame(data)
    tparams <- list(
      data = data, area = "area", fixed = fixed, layout = layout, start = start,
      xlim = c(data$xmin[1], data$xmax[1]), ylim = c(data$ymin[1], data$ymax[1])
    )
    for (x in intersect(c("subgroup", "subgroup2", "subgroup3"), names(data))) {
      tparams[x] <- x
    }
    data <- do.call(treemapify::treemapify, tparams)
    data$width <- data$xmax - data$xmin
    data$height <- data$ymax - data$ymin
    data$fill <- ggplot2::alpha(data$fill, data$alpha)
    gl <- grid::rectGrob(
      x = data$xmin, width = data$width,
      y = data$ymin, height = data$height,
      default.units = "native",
      just = c("left", "bottom"),
      gp = grid::gpar(
        col = data$colour, fill = data$fill,
        lwd = data$linewidth, lty = data$linetype
      )
    )
    gl$name <- grid::grobName(gl, "geom_treemap")
    gl
  })
  treemaps <- do.call(grid::grobTree, treemaps)
  treemaps$name <- grid::grobName(treemaps, "geom_treecol")
  treemaps
}

GeomTreecol <- ggplot2::ggproto(
  "GeomTreecol", ggplot2::GeomCol,
  required_aes = c("x", "y"),
  optional_aes = c("subgroup", "subgroup2", "subgroup3"),
  default_aes = ggplot2::aes(
    colour = "grey", fill = "grey35", linewidth = 0.5, linetype = 1, alpha = NA,
  ),
  setup_data = setup_data,
  draw_panel = draw_panel
)
