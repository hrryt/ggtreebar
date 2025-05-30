% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GeomTreecol.R, R/geom_treebar.R
\docType{data}
\name{geom_treebar}
\alias{geom_treebar}
\alias{GeomTreecol}
\alias{geom_treecol}
\title{Treemap Bar Charts}
\usage{
geom_treebar(
  mapping = NULL,
  data = NULL,
  stat = "count",
  position = "stack",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  ...
)

geom_treecol(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "stack",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{stat}{Override the default connection between \code{geom_treebar()} and
\code{stat_count()}.}

\item{position}{A position adjustment to use on the data for this layer. This
can be used in various ways, including to prevent overplotting and
improving the display. The \code{position} argument accepts the following:
\itemize{
\item The result of calling a position function, such as \code{position_jitter()}.
This method allows for passing extra arguments to the position.
\item A string naming the position adjustment. To give the position as a
string, strip the function name of the \code{position_} prefix. For example,
to use \code{position_jitter()}, give the position as \code{"jitter"}.
\item For more information and other ways to specify the position, see the
\link[ggplot2:layer_positions]{layer position} documentation.
}}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{fixed}{Deprecated. Use \code{layout = "fixed"} instead. Will be removed in
later versions.}

\item{layout}{The layout algorithm, one of either 'squarified' (the
default), 'scol', 'srow' or 'fixed'. See Details for full details on the
different layout algorithms.}

\item{start}{The corner in which to start placing the tiles. One of
'bottomleft' (the default), 'topleft', 'topright' or 'bottomright'.}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}'s \code{params} argument. These
arguments broadly fall into one of 4 categories below. Notably, further
arguments to the \code{position} argument, or aesthetics that are required
can \emph{not} be passed through \code{...}. Unknown arguments that are not part
of the 4 categories below are ignored.
\itemize{
\item Static aesthetics that are not mapped to a scale, but are at a fixed
value and apply to the layer as a whole. For example, \code{colour = "red"}
or \code{linewidth = 3}. The geom's documentation has an \strong{Aesthetics}
section that lists the available options. The 'required' aesthetics
cannot be passed on to the \code{params}. Please note that while passing
unmapped aesthetics as vectors is technically possible, the order and
required length is not guaranteed to be parallel to the input data.
\item When constructing a layer using
a \verb{stat_*()} function, the \code{...} argument can be used to pass on
parameters to the \code{geom} part of the layer. An example of this is
\code{stat_density(geom = "area", outline.type = "both")}. The geom's
documentation lists which parameters it can accept.
\item Inversely, when constructing a layer using a
\verb{geom_*()} function, the \code{...} argument can be used to pass on parameters
to the \code{stat} part of the layer. An example of this is
\code{geom_area(stat = "density", adjust = 0.5)}. The stat's documentation
lists which parameters it can accept.
\item The \code{key_glyph} argument of \code{\link[ggplot2:layer]{layer()}} may also be passed on through
\code{...}. This can be one of the functions described as
\link[ggplot2:draw_key]{key glyphs}, to change the display of the layer in the legend.
}}
}
\value{
A \code{\link[ggplot2:layer]{ggplot2::layer()}}.
}
\description{
\code{ggplot2} geoms analogous to \code{\link[ggplot2:geom_bar]{ggplot2::geom_bar()}} and \code{\link[ggplot2:geom_bar]{ggplot2::geom_col()}}
that allow for treemaps like with \code{\link[treemapify:geom_treemap]{treemapify::geom_treemap()}}
nested within each bar segment.
}
\details{
\code{data} is split by all aesthetics except for the \code{subgroup} aesthetics.

A treemap is then drawn using \code{\link[treemapify:treemapify]{treemapify::treemapify()}} from each section
of the \code{data}, inheriting its aesthetics, and using the \code{subgroup} aesthetics
to determine hierarchy.
}
\section{Aesthetics}{

\code{geom_treebar()} understands the following aesthetics
(required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \code{alpha}
\item \code{colour}
\item \code{fill}
\item \code{linetype}
\item \code{linewidth}
\item \code{subgroup}
\item \code{subgroup2}
\item \code{subgroup3}
}

\code{geom_treecol()} understands the following aesthetics
(required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \code{alpha}
\item \code{colour}
\item \code{fill}
\item \code{linetype}
\item \code{linewidth}
\item \code{subgroup}
\item \code{subgroup2}
\item \code{subgroup3}
}

Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.

\code{stat_count()} understands the following aesthetics
(required aesthetics are in bold):
\itemize{
\item \strong{\code{x} \emph{or} \code{y}}
\item \code{group}
\item \code{weight}
}

Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.
}

\section{Computed variables}{

These are calculated by the 'stat' part of layers and can be accessed with
\link[ggplot2:aes_eval]{delayed evaluation}.
\itemize{
\item \code{after_stat(count)}\cr
number of points in bin.
\item \code{after_stat(prop)}\cr
groupwise proportion
}
}

\examples{
library(ggplot2)
ggplot(diamonds, aes(clarity, fill = cut, subgroup = color)) +
  geom_treebar()
ggplot(diamonds, aes(y = cut, fill = color, subgroup = clarity)) +
  geom_treebar(position = "dodge")
}
\seealso{
\code{\link[=geom_treebar_subgroup_border]{geom_treebar_subgroup_border()}}, \code{\link[=geom_treebar_subgroup_text]{geom_treebar_subgroup_text()}}.
}
\keyword{datasets}
