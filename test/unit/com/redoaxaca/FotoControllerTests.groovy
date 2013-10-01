package com.redoaxaca



import org.junit.*
import grails.test.mixin.*

@TestFor(FotoController)
@Mock(Foto)
class FotoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/foto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fotoInstanceList.size() == 0
        assert model.fotoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fotoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fotoInstance != null
        assert view == '/foto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/foto/show/1'
        assert controller.flash.message != null
        assert Foto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/foto/list'

        populateValidParams(params)
        def foto = new Foto(params)

        assert foto.save() != null

        params.id = foto.id

        def model = controller.show()

        assert model.fotoInstance == foto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/foto/list'

        populateValidParams(params)
        def foto = new Foto(params)

        assert foto.save() != null

        params.id = foto.id

        def model = controller.edit()

        assert model.fotoInstance == foto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/foto/list'

        response.reset()

        populateValidParams(params)
        def foto = new Foto(params)

        assert foto.save() != null

        // test invalid parameters in update
        params.id = foto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/foto/edit"
        assert model.fotoInstance != null

        foto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/foto/show/$foto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        foto.clearErrors()

        populateValidParams(params)
        params.id = foto.id
        params.version = -1
        controller.update()

        assert view == "/foto/edit"
        assert model.fotoInstance != null
        assert model.fotoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/foto/list'

        response.reset()

        populateValidParams(params)
        def foto = new Foto(params)

        assert foto.save() != null
        assert Foto.count() == 1

        params.id = foto.id

        controller.delete()

        assert Foto.count() == 0
        assert Foto.get(foto.id) == null
        assert response.redirectedUrl == '/foto/list'
    }
}
