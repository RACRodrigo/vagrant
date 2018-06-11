class cacti ($redirect = true) {

    contain cacti::install

    if $redirect {
        contain cacti::redirect
    }

}
