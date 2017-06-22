# Functions for working with Java

# Alias: jhome
__java_set_home() {
    JAVA_VERSION="$1"
    export JAVA_HOME="$(/usr/libexec/java_home -v $JAVA_VERSION)"
    java -version
}
