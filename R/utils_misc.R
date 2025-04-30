#' Format error messages as html
#'
#' @description Format error messages as html
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
err2html <- function(err){
  tags$code(HTML(cli::ansi_html(as.character(err))))
}


if_not_numeric_return_default <- function(x, default){
  if(!is.numeric(x))
    return(default)
  else return(x)
}

`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

# If LHS is NA, NULL, or an empty string return RHS, otherwise return LHS
`%|?|%` <- function(x, y) {
  if (is.null(x))
    return(y)
  else if (length(x) > 1 || length(x) == 0 )
    return(x)
  else if (is.na(x))
    return(y)
  else if(nchar(x) == 0)
    return(y)
  else
    return(x)

}


#' Validate a column name in a dataset
#'
#' Checks that the provided `colname` is non-NULL, non-empty, and actually
#' one of the column names of `dataset`. If so, returns `colname`; otherwise
#' returns `NULL`.
#'
#' @param colname A single character string giving the name of the column to validate.
#' @param dataset A data frame in which to look for `colname`.
#'
#' @return
#' - If `colname` is `NULL`, empty, or not among `colnames(dataset)`, returns `NULL`.
#' - Otherwise returns the (validated) column name as a character string.
#'
#' @keywords internal
#' @noRd
#' @export
validate_column <- function(colname, dataset){
  if (is.null(colname)) {
    return(NULL)
  } else if (all(nzchar(colname)) && all(colname %in% colnames(dataset))) {
    return(colname)
  } else {
    return(NULL)
  }
}

#' Ensure 'level' is present in column of dataset
#'
#' First validates that `colname` exists in `dataset` (via
#' [validate_column()]), then checks that the provided `level` is non-NULL
#' and appears among the values in that column. If valid, returns `level`;
#' otherwise returns `NULL`.
#'
#' @param colname A single character string naming a column in `dataset`.
#' @param level A length-1 value to validate as one of the entries in
#'   `dataset[[colname]]`.
#' @param dataset A data frame containing the column to be checked.
#'
#' @return
#' - If `colname` is invalid or `level` is `NULL` or not found in
#'   `dataset[[colname]]`, returns `NULL`.
#' - Otherwise returns the (validated) `level` value.
#'
#' @keywords internal
#' @noRd
validate_level <- function(colname, level, dataset){
  validated_colname <- validate_column(colname, dataset)
  if (is.null(validated_colname)) {
    return(NULL)
  }
  if (is.null(level)) {
    return(NULL)
  }
  if (level %in% dataset[[validated_colname]]) {
    return(level)
  }
  return(NULL)
}

