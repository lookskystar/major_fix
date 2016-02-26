package com.major.base.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * 
 * @Title: ShiroRealm.java
 * @Description: TODO(自定义Shiro)
 * @author eleven
 * @date 2014-3-3 上午11:53:18
 *
 */
public class ShiroRealm extends AuthorizingRealm {

	/* (非 Javadoc)
	* <p>Title: doGetAuthorizationInfo</p>
	* <p>Description: </p>
	* @param arg0
	* @return
	* @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	*/
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (非 Javadoc)
	* <p>Title: doGetAuthenticationInfo</p>
	* <p>Description: </p>
	* @param arg0
	* @return
	* @throws AuthenticationException
	* @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	*/
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0) throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}


	

}
