package org.lip6.struts.servletAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.lip6.struts.actionForm.AddContactValidationForm;
import org.lip6.struts.domain.DAOContact;

public class AddContactAction extends Action {

	public ActionForward execute(final ActionMapping pMapping, ActionForm pForm, final HttpServletRequest pRequest,
			final HttpServletResponse pResponse) {

		final AddContactValidationForm lForm = (AddContactValidationForm) pForm;

		// Contact
		final long id = lForm.getId();
		// La fonction trim permet de supprimer les espaces en d�but et en fin
		// de cha�ne
		// s'il y a plusieurs espaces entre les mots, replaceAll les remplacent
		// par un seul espace

		final String firstName = lForm.getFirstName().trim().replaceAll(" +", " ");
		final String lastName = lForm.getLastName().trim().replaceAll(" +", " ");
		final String email = lForm.getEmail();

		// Address
		final String street = lForm.getStreet().trim().replaceAll(" +", " ");
		final String city = lForm.getCity().trim().replaceAll(" +", " ");
		final String zip = lForm.getZip().trim().replaceAll(" +", " ");
		final String country = lForm.getCountry().trim().replaceAll(" +", " ");

		// Phone
		final String phoneKind = lForm.getPhoneKind().trim().replaceAll(" +", " ");
		final String phoneNumber = lForm.getPhoneNumber().trim().replaceAll(" +", " ");
		
		// Group
		final long idgroup = lForm.getIdGroup();

		// create a new Contact
		final DAOContact lDAOContact = new DAOContact();
		final String lError = lDAOContact.addContact(id, firstName, lastName, email, id, street, city, zip, country, id,
				phoneKind, phoneNumber, idgroup);

		if (lError == null) {
			// if no exception is raised, forward "success"
			return pMapping.findForward("success");
		} else {
			// If any exception, return the "error" forward
			return pMapping.findForward("error");
		}
	}
}
