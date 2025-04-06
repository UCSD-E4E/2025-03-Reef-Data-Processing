WITH priority_images AS (
  SELECT replace(data_paths.path || images.path, '/mnt/fishsense_data_reef/REEF/data', '/home/ubuntu/data') as paths, images.camera_sn, dive_slates.unc_path, canonical_dives.checksum, canonical_dives.spin_slate
  FROM images
  INNER JOIN canonical_dives ON images.dive = canonical_dives.path
  INNER JOIN dive_slates ON canonical_dives.slate_id = idx
  LEFT JOIN laser_labels ON images.image_md5 = laser_labels.cksum
  LEFT JOIN priorities ON canonical_dives.priority = priorities.name
  LEFT JOIN data_paths ON images.data_path = data_paths.idx
  LEFT JOIN headtail_labels ON images.image_md5 = headtail_labels.cksum
  WHERE canonical_dives.slate_id IS NOT NULL
  AND priorities.name = 'HIGH'
  AND images.ignore = false
  AND images.field_cal_ignore = false
  AND laser_labels.x IS NULL
),
grouped_images AS (
  SELECT array_agg(paths) as paths, camera_sn, unc_path, checksum, spin_slate
  FROM priority_images
  GROUP BY camera_sn, checksum, unc_path, spin_slate
),
params AS (
  SELECT replace(cameras.lens_cal_path, '//e4e-nas.ucsd.edu/fishsense/Fishsense Lite Calibration Parameters', '/home/ubuntu/lens_cal') as lens_cal_path, cameras.name || '_' || checksum as name, paths, replace(unc_path, '//e4e-nas.ucsd.edu/fishsense_data', '/mnt/fishsense_data') as pdf_path, checksum, spin_slate
  FROM grouped_images
  LEFT JOIN cameras ON grouped_images.camera_sn = cameras.serial_number
)
SELECT 
json_object(
  'jobs': json_arrayagg(
    json_object(
      'display_name': name,
      'job_name': 'field_calibrate_laser',
      'parameters': json_object(
        'data': paths,
        'lens-calibration': lens_cal_path,
		'laser-labels': '/home/ubuntu/scripts/13_field_laser_calibration_labels.json',
		'pdf': pdf_path,
		'rotate-pdf': coalesce(spin_slate, false),
        'output': '/home/ubuntu/results/' || checksum || '-laser.pkg'
      )
    )
  )
)
FROM params