#' Treemap Bar Charts
#'
#' `ggplot2` geoms analogous to [ggplot2::geom_bar()] and [ggplot2::geom_col()]
#' that allow for treemaps like with [treemapify::geom_treemap()]
#' nested within each bar segment.
#'
#' `data` is split by all aesthetics except for the `subgroup` aesthetics.
#'
#' A treemap is then drawn using [treemapify::treemapify()] from each section
#' of the `data`, inheriting its aesthetics, and using the `subgroup` aesthetics
#' to determine hierarchy.
#'
#' @inheritParams ggplot2::geom_bar
#' @inheritParams treemapify::geom_treemap
#' @param stat Override the default connection between `geom_treebar()` and
#' `stat_count()`.
#' @section Aesthetics:
#' `geom_treebar()` understands the following aesthetics
#' (required aesthetics are in bold):
#' * **`x`**
#' * **`y`**
#' * `alpha`
#' * `colour`
#' * `fill`
#' * `linetype`
#' * `linewidth`
#' * `subgroup`
#' * `subgroup2`
#' * `subgroup3`
#'
#' `geom_treecol()` understands the following aesthetics
#' (required aesthetics are in bold):
#' * **`x`**
#' * **`y`**
#' * `alpha`
#' * `colour`
#' * `fill`
#' * `linetype`
#' * `linewidth`
#' * `subgroup`
#' * `subgroup2`
#' * `subgroup3`
#'
#' Learn more about setting these aesthetics in `vignette("ggplot2-specs")`.
#'
#' `stat_count()` understands the following aesthetics
#' (required aesthetics are in bold):
#' * **`x` *or* `y`**
#' * `group`
#' * `weight`
#'
#' Learn more about setting these aesthetics in `vignette("ggplot2-specs")`.
#'
#' @section Computed variables:
#' These are calculated by the 'stat' part of layers and can be accessed with
#' [delayed evaluation][ggplot2::aes_eval].
#' * `after_stat(count)`\cr
#' number of points in bin.
#' * `after_stat(prop)`\cr
#' groupwise proportion
#'
#' @seealso [geom_treebar_subgroup_border()], [geom_treebar_subgroup_text()].
#' @returns A [ggplot2::layer()].
#'
#' @examples
#' library(ggplot2)
#' ggplot(diamonds, aes(clarity, fill = cut, subgroup = color)) +
#'   geom_treebar()
#' ggplot(diamonds, aes(y = cut, fill = color, subgroup = clarity)) +
#'   geom_treebar(position = "dodge")
#' @export
geom_treebar <- function (mapping = NULL, data = NULL, stat = "count",
                          position = "stack", na.rm = FALSE, show.legend = NA,
                          inherit.aes = TRUE, fixed = NULL,
                          layout = "squarified", start = "bottomleft", ...)
{
  ggplot2::layer(
    data = data, mapping = mapping, stat = stat,
    geom = GeomTreecol, position = position, show.legend = show.legend,
    inherit.aes = inherit.aes, params = list(
      na.rm = na.rm, fixed = fixed, layout = layout, start = start, ...
    )
  )
}

#' @rdname geom_treebar
#' @export
geom_treecol <- function (mapping = NULL, data = NULL, stat = "identity",
                          position = "stack", na.rm = FALSE, show.legend = NA,
                          inherit.aes = TRUE, fixed = NULL,
                          layout = "squarified", start = "bottomleft", ...)
{
  ggplot2::layer(
    data = data, mapping = mapping, stat = stat,
    geom = GeomTreecol, position = position, show.legend = show.legend,
    inherit.aes = inherit.aes, params = list(
      na.rm = na.rm, fixed = fixed, layout = layout, start = start, ...
    )
  )
}
