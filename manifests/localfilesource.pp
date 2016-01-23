#
#
#
define sumo::localfilesource (
  $sourceName,
  $description = undef,
  $category = undef,
  $hostName = undef,
  $timeZone = undef,
  $automaticDateParsing = undef,
  $multilineProcessingEnabled = undef,
  $useAutolineMatching = undef,
  $manualPrefixRegexp = undef,
  $forceTimeZone = undef,
  $defaultDateFormat = undef,
  $filters = undef,
  $pathExpression,
  $blacklist = undef,
  $encoding = undef,
) {
  include sumo
  include sumo::params

  $sourceType = 'LocalFile'
  $syncSources  = $::sumo::params::syncSources

  file { "${syncSources}/${name}.json":
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/localfilesource.json.erb"),
  }
}

