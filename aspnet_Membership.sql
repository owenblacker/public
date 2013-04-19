Select
	A.ApplicationName,
	U.UserName, U.LastActivityDate,
	M.Email, M.IsApproved, M.IsLockedOut, M.LastLoginDate,
	U.UserId,
	M.[Password], M.PasswordSalt
From
	aspnet_Applications as A
	Inner Join aspnet_Users as U on U.ApplicationId = A.ApplicationId
	Inner Join aspnet_Membership as M on M.UserId = U.UserId
