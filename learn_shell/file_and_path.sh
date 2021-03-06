# Shell font configuration in terminal
# Menlo, 14 pt.

# Get parent directory
base_dir=$(dirname $0)/..

# Linux and mac
abspath=$(cd ${0%/*} && echo $PWD/${0##*/})

# Check value
if [ "x$LOG_DIR" = "x" ]; then
    LOG_DIR="$base_dir/logs"
fi

# Check direcotry
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# Check file
if [ -f "$file" ]; then
    echo "$file found."
else
    echo "$file not found."
fi

# Add multiple java class paths
for file in $base_dir/core/build/dependant-libs-${SCALA_VERSION}*/*.jar;
do
  CLASSPATH=$CLASSPATH:$file
done

# Check which java to use
if [ -z "$JAVA_HOME" ]; then
  JAVA="java"
else
  JAVA="$JAVA_HOME/bin/java"
fi